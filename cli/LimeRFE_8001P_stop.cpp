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

int printHelp()
{
    printf("--help, -h\t\tPrint help.\n");
    printf("--device, -d\t\tUSB device path. default:%s\n", devicePath.c_str());
    printf("--rfe-config\t\tConfig file for channel 1. default:%s\n", rfeConfig.c_str());
    return 0;
}


enum CMDArgument
{
    RFE_CONFIG = 1,
};


int main(int argc, char** argv)
{
    static struct option long_options[] = {
        {"help", no_argument, 0, 'h'},
        {"device", required_argument, 0, 'd'},
        {"rfe-config", required_argument, 0, RFE_CONFIG},
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
        }
    }

    //limerfe_8001p_boardState state;
    int result = 0;
 
    limerfe_8001p = LimeRFE_8001P_Open("/dev/ttyACM0", nullptr);
    //limerfe_8001p = LimeRFE_8001P_FindAndOpen(nullptr);

    if (limerfe_8001p == nullptr) {
        std::cout << "Error: failed to open device" << std::endl;
        return -1;
    }
    else {
        std::cout << "Port opened" << std::endl;
    }

    printf("Disabling LimeRFE_8001P board ...\n");
    LimeRFE_8001P_LoadConfig(limerfe_8001p, "LimeRFE_8001P_board_off.ini");

//---- Start Channel 1 -----//
    printf("Selecting channel 1\n");
    result = LimeRFE_8001P_Select_Channel(limerfe_8001p, LimeRFE_8001P_CH1);

    printf("Disable LMS8001...\n");
    LimeRFE_8001P_LMS8_Enable(limerfe_8001p, 0);
     
    printf("Disable SC1905...\n");
    LimeRFE_8001P_SC1905_Enable(limerfe_8001p, LimeRFE_8001P_CH1, 0); // Enable=1; Disable=0

//---- End Channel 1 -----//

//---- Start Channel 2 -----//
   printf("Selecting channel 2\n");
    result = LimeRFE_8001P_Select_Channel(limerfe_8001p, LimeRFE_8001P_CH2);

    printf("Disable LMS8001...\n");
    LimeRFE_8001P_LMS8_Enable(limerfe_8001p, 0);
     
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
