#ifndef __lms8001_pnlPLLConfig_view__
#define __lms8001_pnlPLLConfig_view__

/**
@file
Subclass of pnlPLLConfig_view, which is generated by wxFormBuilder.
*/

#include "lms8001_wxgui.h"
//// end generated include
#include <map>
#include "../lime/LMS8001_parameters.h"
class LMS8001;
/** Implementing pnlPLLConfig_view */
class lms8001_pnlPLLConfig_view : public pnlPLLConfig_view
{
	protected:
		// Handlers for pnlPLLConfig_view events.
		void ParameterChangeHandler( wxCommandEvent& event );
	public:
		/** Constructor */
		lms8001_pnlPLLConfig_view( wxWindow* parent );
	//// end generated class members
	lms8001_pnlPLLConfig_view(wxWindow* parent, wxWindowID id = wxID_ANY, const wxPoint& pos = wxDefaultPosition, const wxSize& size = wxDefaultSize, long style = wxTAB_TRAVERSAL);
    void Initialize(LMS8001* pControl);
    void UpdateGUI();

	void OnSelectProfileClick(wxCommandEvent& event);

protected:
    LMS8001* lmsControl;
    std::map<wxWindow*, LMS8Parameter> wndId2Enum;
};

#endif // __lms8001_pnlPLLConfig_view__
