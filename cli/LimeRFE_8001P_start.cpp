// Board and IC configuration (power on) excluding ADF and SC1905

#include <getopt.h>

#include <iostream>
#include <chrono>
#include <thread>
#include <stdio.h>
#include <unistd.h>

#include "LimeRFE_8001P.h"
#include "LMS8001/lime/LMS8API.h"

limerfe_8001p_dev_t* limerfe_8001p = NULL;
lms_device_t* lms8_device = NULL;

int error()
{
    if (lms8_device != NULL)
        LMS8_Close(lms8_device);
    if (limerfe_8001p != NULL)
        LimeRFE_8001P_Close(limerfe_8001p);
    exit(-1);
}

std::string devicePath = "/dev/ttyACM0";
std::string rfeConfig = "LimeRFE_8001P_board_on.ini";
std::string lms8ch1Config = "LimeRFE_8001P_IC1.ini";
std::string lms8ch2Config = "LimeRFE_8001P_IC2.ini";
double lo1 = 4.9;
double lo2 = 4.9;
double adf_refclk = 10;
double adf_fvco = 30.72;

int printHelp()
{
    printf("--help, -h\t\tPrint help.\n");
    printf("--device, -d\t\tUSB device path. default:%s\n", devicePath.c_str());
    printf("--lms8-config-ch1\t\tConfig file for channel 1. default:%s\n", lms8ch1Config.c_str());
    printf("--lms8-config-ch2\t\tConfig file for channel 1. default:%s\n", lms8ch2Config.c_str());
    printf("--rfe-config\t\tConfig file for channel 1. default:%s\n", rfeConfig.c_str());
    printf("--lo-ch1\t\tChannel 1 LO in GHz. default:%g\n", lo1);
    printf("--lo-ch2\t\tChannel 2 LO in GHz. default:%g\n", lo2);
    printf("--adf-refclk\t\tADF4002 Reference clock in MHz, default:%g\n", adf_refclk);
    printf("--adf-fvco\t\tADF4002 VCO output frequency in MHz\n");
    return 0;
}

enum CMDArgument
{
    RFE_CONFIG = 1,
    LMS8_CONFIG_CH1,
    LMS8_CONFIG_CH2,
    LO_CH1,
    LO_CH2,
    ADF4002_REFCLK,
    ADF4002_FVCO
};

int main(int argc, char** argv)
{
    static struct option long_options[] = {
        {"help", no_argument, 0, 'h'},
        {"device", required_argument, 0, 'd'},
        {"rfe-config", required_argument, 0, RFE_CONFIG},
        {"lms8-config-ch1", required_argument, 0, LMS8_CONFIG_CH1},
        {"lms8-config-ch2", required_argument, 0, LMS8_CONFIG_CH2},
        {"lo-ch1", required_argument, 0, LO_CH1},
        {"lo-ch2", required_argument, 0, LO_CH2},
        {"adf-refclk", required_argument, 0, ADF4002_REFCLK},
        {"adf-fvco", required_argument, 0, ADF4002_FVCO},
        {0, 0, 0,  0}
    };

    int long_index = 0;
    int option = 0;
    while ((option = getopt_long_only(argc, argv, "", long_options, &long_index)) != -1)
    {
        switch (option)
        {
        case 'h': return printHelp();
        case 'd':
            devicePath = optarg;
            break;
        case RFE_CONFIG:
            rfeConfig = optarg;
            break;
        case LMS8_CONFIG_CH1:
            lms8ch1Config = optarg;
            break;
        case LMS8_CONFIG_CH2:
            lms8ch2Config = optarg;
            break;
        case LO_CH1:
            lo1 = std::stod(optarg);
            break;
        case LO_CH2:
            lo2 = std::stod(optarg);
            break;
        case ADF4002_REFCLK:
            adf_refclk = std::stod(optarg);
            break;
        case ADF4002_FVCO:
            adf_fvco = std::stod(optarg);
            break;
        }
    }

    //limerfe_8001p_boardState state;
    int result = 0;
    int isLocked = 0;

    limerfe_8001p = LimeRFE_8001P_Open(devicePath.c_str(), nullptr);
    //limerfe_8001p = LimeRFE_8001P_FindAndOpen(nullptr);

    if (limerfe_8001p == nullptr) {
        std::cout << "Error: failed to open device" << std::endl;
        return -1;
    }
    else {
        std::cout << "Port opened" << std::endl;
    }

    printf("Resetting LimeRFE_8001P board ...\n");
    LimeRFE_8001P_Reset(limerfe_8001p);

    int rout, nout;
    if (adf_refclk != 0 && adf_fvco != 0)
        LimeRFE_8001P_ADF4002_ConfigRefVco(limerfe_8001p, adf_refclk, adf_fvco, &rout, &nout);

    printf("Loading LimeRFE_8001P board ini file ...\n");
    LimeRFE_8001P_LoadConfig(limerfe_8001p, rfeConfig.c_str());

//---- Start Channel 1 -----//
    printf("Selecting channel 1\n");
    result = LimeRFE_8001P_Select_Channel(limerfe_8001p, LimeRFE_8001P_CH1);

    printf("Enable LMS8001...\n");
    LimeRFE_8001P_LMS8_Enable(limerfe_8001p, 1);

    if (LimeRFE_8001P_LMS8_Open(limerfe_8001p, &lms8_device))
        error();

    printf("Resetting LMS8001...\n");
    result = LMS8_Reset(lms8_device);
    if (result != LMS_SUCCESS)
        printf("Error resetting.\n");
    printf("Finished\n");

    printf("Loading LMS8001 state...\n");
    result = LMS8_LoadConfig(lms8_device, lms8ch1Config.c_str());
    if (result != LMS_SUCCESS)
        printf("Error loading state.\n");
    printf("Finished\n");

    printf("Smart Tuning PLL...\n");

    result = LMS8_PLL_Smart_Tune(lms8_device, lo1); // Ricardai, reikia kad ta 4,9 verte kazkaip butu galima keisti, arba per faila arba per inputa bash scripte. Sita verte gali skirtis nuo channel 2 vertes
    if (result != LMS_SUCCESS)
        printf("Error locking. Result: %d\n", result);

    isLocked = LMS8_Get_SPI_Reg_bits(lms8_device, PLL_LOCK);
    printf("Is Locked: %d\n", isLocked);

    printf("Disable SC1905...\n");
    LimeRFE_8001P_SC1905_Enable(limerfe_8001p, LimeRFE_8001P_CH1, 0); // Enable=1; Disable=0

//---- End Channel 1 -----//

//---- Start Channel 2 -----//
    printf("Selecting channel 2\n");
    result = LimeRFE_8001P_Select_Channel(limerfe_8001p, LimeRFE_8001P_CH2);

    printf("Enable LMS8001...\n");
    LimeRFE_8001P_LMS8_Enable(limerfe_8001p, 1);

    if (LimeRFE_8001P_LMS8_Open(limerfe_8001p, &lms8_device))
        error();

    printf("Resetting LMS8001...\n");
    result = LMS8_Reset(lms8_device);
    if (result != LMS_SUCCESS)
        printf("Error resetting.\n");
    printf("Finished\n");

    printf("Loading LMS8001 state...\n");
    result = LMS8_LoadConfig(lms8_device, lms8ch2Config.c_str());
    if (result != LMS_SUCCESS)
        printf("Error loading state.\n");
    printf("Finished\n");

    printf("Smart Tuning PLL...\n");

    result = LMS8_PLL_Smart_Tune(lms8_device, lo2); // Ricardai, reikia kad ta 4,9 verte kazkaip butu galima keisti, arba per faila arba per inputa bash scripte. Sita verte gali skirtis nuo channel 1 vertes
    if (result != LMS_SUCCESS)
        printf("Error locking. Result: %d\n", result);

    isLocked = LMS8_Get_SPI_Reg_bits(lms8_device, PLL_LOCK);
    printf("Is Locked: %d\n", isLocked);

    printf("Disable SC1905...\n");
    LimeRFE_8001P_SC1905_Enable(limerfe_8001p, LimeRFE_8001P_CH2, 0); // Enable=1; Disable=0

//---- End Channel 2 -----//

    printf("Finished\n");

    //Close device
    LMS8_Close(lms8_device);

    //Close port
    LimeRFE_8001P_Close(limerfe_8001p);
    return 0;
}
