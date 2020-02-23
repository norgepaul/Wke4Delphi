unit Langji.Wke.lib;

interface

uses
  windows, sysutils, Langji.Miniblink.libs, Langji.Miniblink.types,
  Langji.Wke.types;


  //================================wkeWebView============================
var
  UseFastMB: Boolean = False;
 // mbLibFileName:string ='mb.dll';

  wkeLibHandle: THandle = 0;
  wkeLibFileName: string = 'node.dll';
  wkePluginDir: string = '';
  wkeIsInDll: Boolean = false;      //ÊÇ·ñÔÚdllÖÐÔËÐÐ
  wkeInitialize: procedure; cdecl;
  wkeInitializeEx: procedure(settings: PwkeSettings); cdecl;
  wkeConfigure: procedure(settings: PwkeSettings); cdecl;
  wkeFinalize: procedure; cdecl;
  wkeUpdate: procedure; cdecl;
  wkeGetVersion: function(): Integer; cdecl;
  wkeGetVersionString: function(): putf8; cdecl;
  wkeSetFileSystem: procedure(pfn_open: FILE_OPEN; pfn_close: FILE_CLOSE; pfn_size: FILE_SIZE; pfn_read: FILE_READ; pfn_seek: FILE_SEEK); cdecl;
  wkeCreateWebView: function(): wkeWebView; cdecl;
  wkeGetWebView: function(name: Pchar): wkeWebView; cdecl;
  wkeDestroyWebView: procedure(webView: wkeWebView); cdecl;
  wkeGetName: function(webView: wkeWebView): PAnsiChar; cdecl;
  wkeSetName: procedure(webView: wkeWebView; name: PAnsiChar); cdecl;
  wkeIsTransparent: function(webView: wkeWebView): Boolean; cdecl;
  wkeSetTransparent: procedure(webView: wkeWebView; transparent: Boolean); cdecl;
  wkeSetUserAgent: procedure(webView: wkeWebView; userAgent: Putf8); cdecl;
  wkeSetUserAgentW: procedure(webView: wkeWebView; userAgent: Pwchar_t); cdecl;
  wkeLoadURL: procedure(webView: wkeWebView; url: Putf8); cdecl;
  wkeLoadURLW: procedure(webView: wkeWebView; url: Pwchar_t); cdecl;
  wkePostURL: procedure(wkeView: wkeWebView; url: Putf8; postData: PAnsiChar; postLen: Integer); cdecl;
  wkePostURLW: procedure(wkeView: wkeWebView; url: Pwchar_t; postData: PAnsiChar; postLen: Integer); cdecl;
  wkeLoadHTML: procedure(webView: wkeWebView; html: Putf8); cdecl;
  wkeLoadHTMLW: procedure(webView: wkeWebView; html: Pwchar_t); cdecl;
  wkeLoadFile: procedure(webView: wkeWebView; filename: Putf8); cdecl;
  wkeLoadFileW: procedure(webView: wkeWebView; filename: Pwchar_t); cdecl;
  wkeLoad: procedure(webView: wkeWebView; str: Putf8); cdecl;
  wkeLoadW: procedure(webView: wkeWebView; str: Pwchar_t); cdecl;
  wkeIsLoading: function(webView: wkeWebView): Boolean; cdecl;
  wkeIsLoadingSucceeded: function(webView: wkeWebView): Boolean; cdecl;
  wkeIsLoadingFailed: function(webView: wkeWebView): Boolean; cdecl;
  wkeIsLoadingCompleted: function(webView: wkeWebView): Boolean; cdecl;
  wkeIsDocumentReady: function(webView: wkeWebView): Boolean; cdecl;
  wkeStopLoading: procedure(webView: wkeWebView); cdecl;
  wkeReload: procedure(webView: wkeWebView); cdecl;
  wkeGetTitle: function(webView: wkeWebView): putf8; cdecl;
  wkeGetTitleW: function(webView: wkeWebView): pwchar_t; cdecl;
  wkeResize: procedure(webView: wkeWebView; w: Integer; h: Integer); cdecl;
  wkeGetWidth: function(webView: wkeWebView): Integer; cdecl;
  wkeGetHeight: function(webView: wkeWebView): Integer; cdecl;
  wkeGetContentWidth: function(webView: wkeWebView): Integer; cdecl;
  wkeGetContentHeight: function(webView: wkeWebView): Integer; cdecl;
  wkeSetDirty: procedure(webView: wkeWebView; dirty: Boolean); cdecl;
  wkeIsDirty: function(webView: wkeWebView): Boolean; cdecl;
  wkeAddDirtyArea: procedure(webView: wkeWebView; x: Integer; y: Integer; w: Integer; h: Integer); cdecl;
  wkeLayoutIfNeeded: procedure(webView: wkeWebView); cdecl;
  wkePaint: procedure(webView: wkeWebView; bits: Pointer; bufWid: Integer; bufHei: Integer; xDst: Integer; yDst: Integer; w: Integer; h: Integer; xSrc: Integer; ySrc: Integer; bCopyAlpha: Boolean); cdecl;
  wkePaint2: procedure(webView: wkeWebView; bits: Pointer; pitch: Integer); cdecl;
  wkeRepaintIfNeeded: procedure(webView: wkeWebView); cdecl;
  wkeGetViewDC: function(webView: wkeWebView): HDC; cdecl;
  wkeCanGoBack: function(webView: wkeWebView): Boolean; cdecl;
  wkeGoBack: function(webView: wkeWebView): Boolean; cdecl;
  wkeCanGoForward: function(webView: wkeWebView): Boolean; cdecl;
  wkeGoForward: function(webView: wkeWebView): Boolean; cdecl;
  wkeEditorSelectAll: procedure(webView: wkeWebView); cdecl;
  wkeEditorCopy: procedure(webView: wkeWebView); cdecl;
  wkeEditorCut: procedure(webView: wkeWebView); cdecl;
  wkeEditorPaste: procedure(webView: wkeWebView); cdecl;
  wkeEditorDelete: procedure(webView: wkeWebView); cdecl;
  wkeEditorUndo: procedure(webView: wkeWebView); cdecl;       //2018.02.07
  wkeGetCookieW: function(webView: wkeWebView): pwchar_t; cdecl;
  wkeGetCookie: function(webView: wkeWebView): putf8; cdecl;
  wkeSetCookieEnabled: procedure(webView: wkeWebView; enable: Boolean); cdecl;
  wkeIsCookieEnabled: function(webView: wkeWebView): Boolean; cdecl;
  wkeSetMediaVolume: procedure(webView: wkeWebView; volume: Single); cdecl;
  wkeGetMediaVolume: function(webView: wkeWebView): Single; cdecl;
  wkeFireMouseEvent: function(webView: wkeWebView; AMessage: Cardinal; x: Integer; y: Integer; flags: LongInt): Boolean; cdecl;
  wkeFireContextMenuEvent: function(webView: wkeWebView; x: Integer; y: Integer; flags: LongInt): Boolean; cdecl;
  wkeFireMouseWheelEvent: function(webView: wkeWebView; x: Integer; y: Integer; delta: Integer; flags: LongInt): Boolean; cdecl;
  wkeFireKeyUpEvent: function(webView: wkeWebView; virtualKeyCode: LongInt; flags: LongInt; systemKey: Boolean): Boolean; cdecl;
  wkeFireKeyDownEvent: function(webView: wkeWebView; virtualKeyCode: LongInt; flags: LongInt; systemKey: Boolean): Boolean; cdecl;
  wkeFireKeyPressEvent: function(webView: wkeWebView; charCode: LongInt; flags: LongInt; systemKey: Boolean): Boolean; cdecl;
  wkeSetFocus: procedure(webView: wkeWebView); cdecl;
  wkeKillFocus: procedure(webView: wkeWebView); cdecl;
  wkeGetCaretRect: function(webView: wkeWebView): wkeRect; cdecl;
  wkeRunJS: function(webView: wkeWebView; script: Putf8): jsValue; cdecl;
  wkeRunJSW: function(webView: wkeWebView; script: Pwchar_t): jsValue; cdecl;
  wkeGlobalExec: function(webView: wkeWebView): jsExecState; cdecl;
  wkeSleep: procedure(webView: wkeWebView); cdecl;
  wkeWake: procedure(webView: wkeWebView); cdecl;
  wkeIsAwake: function(webView: wkeWebView): Boolean; cdecl;
  wkeSetZoomFactor: procedure(webView: wkeWebView; factor: Single); cdecl;
  wkeGetZoomFactor: function(webView: wkeWebView): Single; cdecl;
  wkeSetEditable: procedure(webView: wkeWebView; editable: Boolean); cdecl;
  wkeGetString: function(AString: wkeString): putf8; cdecl;
  wkeGetStringW: function(AString: wkeString): pwchar_t; cdecl;
  wkeSetString: procedure(AString: wkeString; str: Putf8; len: size_t); cdecl;
  wkeSetStringW: procedure(AString: wkeString; str: Pwchar_t; len: size_t); cdecl;
  wkeOnTitleChanged: procedure(webView: wkeWebView; callback: wkeTitleChangedCallback; callbackParam: Pointer); cdecl;
  wkeOnURLChanged: procedure(webView: wkeWebView; callback: wkeURLChangedCallback; callbackParam: Pointer); cdecl;
  wkeOnPaintUpdated: procedure(webView: wkeWebView; callback: wkePaintUpdatedCallback; callbackParam: Pointer); cdecl;
  wkeOnAlertBox: procedure(webView: wkeWebView; callback: wkeAlertBoxCallback; callbackParam: Pointer); cdecl;
  wkeOnConfirmBox: procedure(webView: wkeWebView; callback: wkeConfirmBoxCallback; callbackParam: Pointer); cdecl;
  wkeOnPromptBox: procedure(webView: wkeWebView; callback: wkePromptBoxCallback; callbackParam: Pointer); cdecl;
  wkeOnNavigation: procedure(webView: wkeWebView; callback: wkeNavigationCallback; param: Pointer); cdecl;
  wkeOnCreateView: procedure(webView: wkeWebView; callback: wkeCreateViewCallback; param: Pointer); cdecl;
  wkeOnDocumentReady: procedure(webView: wkeWebView; callback: wkeDocumentReadyCallback; param: Pointer); cdecl;
  wkeOnLoadingFinish: procedure(webView: wkeWebView; callback: wkeLoadingFinishCallback; param: Pointer); cdecl;
  wkeOnConsoleMessage: procedure(webView: wkeWebView; callback: wkeConsoleMessageCallback; callbackParam: Pointer); cdecl;  //  ??

  wkeCreateWebWindow: function(AType: wkeWindowType; parent: HWND; x: Integer; y: Integer; width: Integer; height: Integer): wkeWebView; cdecl;
  wkeDestroyWebWindow: procedure(webWindow: wkeWebView); cdecl;
  wkeGetWindowHandle: function(webWindow: wkeWebView): HWND; cdecl;
  wkeOnWindowClosing: procedure(webWindow: wkeWebView; callback: wkeWindowClosingCallback; param: Pointer); cdecl;
  wkeOnWindowDestroy: procedure(webWindow: wkeWebView; callback: wkeWindowDestroyCallback; param: Pointer); cdecl;
  wkeShowWindow: procedure(webWindow: wkeWebView; show: Boolean); cdecl;
  wkeEnableWindow: procedure(webWindow: wkeWebView; enable: Boolean); cdecl;
  wkeMoveWindow: procedure(webWindow: wkeWebView; x: Integer; y: Integer; width: Integer; height: Integer); cdecl;
  wkeMoveToCenter: procedure(webWindow: wkeWebView); cdecl;
  wkeResizeWindow: procedure(webWindow: wkeWebView; width: Integer; height: Integer); cdecl;
  wkeSetWindowTitle: procedure(webWindow: wkeWebView; title: Putf8); cdecl;
  wkeSetWindowTitleW: procedure(webWindow: wkeWebView; title: Pwchar_t); cdecl;
  wkeSetCspCheckEnable: procedure(webWindow: wkeWebView; b: boolean); cdecl;


//==============================================================================
// ÒÔÏÂº¯ÊýÎªMiniBlinkÌØÓÐ
//==============================================================================






    // minibink ÐÂÔö  2018.1.17
//    ITERATOR3(void, wkeSetCookie, wkeWebView webView, const utf8* url, const utf8* cookie, "cookie¸ñÊ½±ØÐëÊÇ:Set-cookie: PRODUCTINFO=webxpress; domain=.fidelity.com; path=/; secure")
//    WKE_API bool wkeIsMainFrame(wkeWebView webView, wkeWebFrameHandle frameId);
//    WKE_API bool wkeIsWebRemoteFrame(wkeWebView webView, wkeWebFrameHandle frameId);
//    WKE_API wkeWebFrameHandle wkeWebFrameGetMainFrame(wkeWebView webView);
//    WKE_API jsValue wkeRunJsByFrame(wkeWebView webView, wkeWebFrameHandle frameId, const utf8* script, bool isInClosure);
//    WKE_API const utf8* wkeGetURL(wkeWebView webView);
 /// <summary>
 ///  È¡µ±Ç°Url
 /// </summary>
  wkeGetURL: function(webWindow: wkeWebView): putf8; cdecl;
  /// <summary>
  ///   ÉèÖÃCookie minibinkÐÂÔö£¬ cookie¸ñÊ½±ØÐëÊÇ:Set-cookie: PRODUCTINFO=webxpress; domain=.fidelity.com; path=/; secure
  /// </summary>
  wkeSetCookie: procedure(webWindow: wkeWebView; const url, cookie: putf8); cdecl;      //minibink ÐÂÔö
  wkeSetCookieJarPath: procedure(webWindow: wkeWebView; const path: Pwchar_t); cdecl;
  wkeWebFrameGetMainFrame: function(webWindow: wkeWebView): Thandle; cdecl;       //minibink ÐÂÔö  2018.1.17
  wkeIsMainFrame: function(webWindow: wkeWebView; frameId: Thandle): Boolean; cdecl;  //minibink ÐÂÔö  2018.1.17
  wkeRunJsByFrame: function(webWindow: wkeWebView; frameId: Thandle; const script: putf8; isInClosure: boolean): jsValue; cdecl;      // minibink ÐÂÔö  2018.1.17

 // Add 2018.02.07

  // ITERATOR3(void, wkeVisitAllCookie, wkeWebView webView, void* params, wkeCookieVisitor visitor, "") \//20190727
  wkeVisitAllCookie: procedure(webWindow: wkeWebView;params: Pointer; const visitor: wkeCookieVisitor); cdecl;
  //ITERATOR2(void, wkeSetLocalStorageFullPath, wkeWebView webView, const WCHAR* path, "")
  wkeSetLocalStorageFullPath: procedure(webWindow: wkeWebView; const path: Pwchar_t); cdecl;
  //ITERATOR1(void, wkePerformCookieCommand, wkeCookieCommand command, "") \
  wkePerformCookieCommand: procedure(command: wkeCookieCommand); cdecl;
  wkeSetHeadlessEnabled: procedure(webWindow: wkeWebView; b: Boolean); cdecl;
  wkeSetTouchEnabled: procedure(webWindow: wkeWebView; b: Boolean); cdecl;
  wkeSetUIThreadCallback: procedure(webView: wkeWebView; callback: wkeCallUiThread; param: Pointer); cdecl;
  wkeOnLoadUrlBegin: procedure(webView: wkeWebView; callback: wkeLoadUrlBeginCallback; param: Pointer); cdecl;
  wkeOnLoadUrlEnd: procedure(webView: wkeWebView; callback: wkeLoadUrlEndCallback; param: Pointer); cdecl;
  wkeOnDownload: procedure(webView: wkeWebView; callback: wkeDownloadCallback; param: Pointer); cdecl;
  wkeOnDocumentReady2: procedure(webView: wkeWebView; callback: wkeDocumentReadyCallback2; param: Pointer); cdecl;
  wkeOnURLChanged2: procedure(webView: wkeWebView; callback: wkeURLChangedCallback2; callbackParam: Pointer); cdecl;
  wkeSetProxy: procedure(const proxy: pwkeProxy); cdecl;
  wkeSetViewProxy: procedure(webView: wkeWebView; proxy: pwkeProxy); cdecl;

  //ÒÔÏÂ2018.3.14Ôö¼Ó
  //WKE_API void wkeSetDebugConfig(wkeWebView webView, const char* debugString, const char* param);
  {devtools¹¦ÄÜ¡£¿ªÆô·½Ê½ÊÇ£ºwkeSetDebugConfig(m_wkeView, "showDevTools", "E:/mycode/devtools/front_end/inspector.html(utf8±àÂë)");}
  wkeSetDebugConfig: procedure(webView: wkeWebView; const debugString, param: putf8); cdecl;
  //WKE_API void wkeSetDragEnable(wkeWebView webView, bool b);   ¿ªÆô¹Ø±ÕÍÏ×§¹¦ÄÜ
  wkeSetDragEnable: procedure(webView: wkeWebView; b: boolean); cdecl;
  // WKE_API void wkeOnMouseOverUrlChanged(wkeWebView webView, wkeTitleChangedCallback callback, void* callbackParam);
  wkeOnMouseOverUrlChanged: procedure(webView: wkeWebView; callback: wkeTitleChangedCallback; callbackParam: Pointer); cdecl;

  //Add 2018.05.23
  //ITERATOR2(void, wkeAddPluginDirectory, wkeWebView webView, const WCHAR* path, "")
  wkeAddPluginDirectory: procedure(webView: wkeWebView; const path: Pwchar_t); cdecl;
  //ITERATOR1(wkePostBodyElements*, wkeNetGetPostBody, void* jobPtr, "")
  wkeNetGetPostBody : function(job: Pointer):PwkePostBodyElements; cdecl;
  //ITERATOR1(wkeRequestType, wkeNetGetRequestMethod, void* jobPtr, "")
  wkeNetGetRequestMethod  : function(job: Pointer):wkeRequestType; cdecl;
 // void wkeSetDeviceParameter(wkeWebView webView, const char* device, const char* paramStr, int paramInt, float paramFloat)
  wkeSetDeviceParameter: procedure(webView: wkeWebView; const device, paramStr: putf8; paramInt: integer; paramFloat: real); cdecl;
 // ITERATOR1(const utf8*, wkeGetSource, wkeWebView webView, "") \
  wkeGetSource: function(webView: wkeWebView): Putf8; cdecl;
  //ITERATOR1(void, wkeNetHookRequest, void *job, "") \
  wkeNetHookRequest: procedure(job: Pointer); cdecl;
  wkeSetNavigationToNewWindowEnable: procedure(webView: wkeWebView; b: boolean); cdecl; //20180707

  // ITERATOR4(void, wkeNetSetHTTPHeaderField, void* job, wchar_t* key, wchar_t* value, bool response, "") \
  wkeNetSetHTTPHeaderField: procedure(job: Pointer; key: Pwchar_t; value: Pwchar_t; response: Boolean); cdecl;

  //ITERATOR1(wkeWebView, wkeCreateWebCustomWindow, const wkeWindowCreateInfo* info, "") \
  wkeCreateWebCustomWindow: procedure(const info: pwkeWindowCreateInfo); cdecl;   //20190509
    //ITERATOR1(const utf8*, wkeUtilSerializeToMHTML, wkeWebView webView, "") \
  wkeUtilSerializeToMHTML : function( webView: wkeWebView ):PAnsiChar;     cdecl;  //2019.05.09


//================================JScript============================

  jsBindFunction: procedure(name: PAnsiChar; fn: jsNativeFunction; AArgCount: LongInt); cdecl;
  jsBindGetter: procedure(name: PAnsiChar; fn: jsNativeFunction); cdecl;
  jsBindSetter: procedure(name: PAnsiChar; fn: jsNativeFunction); cdecl;
  jsArgCount: function(es: jsExecState): Integer; cdecl;
  jsArgType: function(es: jsExecState; argIdx: Integer): jsType; cdecl;
  jsArg: function(es: jsExecState; argIdx: Integer): jsValue; cdecl;
  jsTypeOf: function(v: jsValue): jsType; cdecl;
  jsIsNumber: function(v: jsValue): Boolean; cdecl;
  jsIsString: function(v: jsValue): Boolean; cdecl;
  jsIsBoolean: function(v: jsValue): Boolean; cdecl;
  jsIsObject: function(v: jsValue): Boolean; cdecl;
  jsIsFunction: function(v: jsValue): Boolean; cdecl;
  jsIsUndefined: function(v: jsValue): Boolean; cdecl;
  jsIsNull: function(v: jsValue): Boolean; cdecl;
  jsIsArray: function(v: jsValue): Boolean; cdecl;
  jsIsTrue: function(v: jsValue): Boolean; cdecl;
  jsIsFalse: function(v: jsValue): Boolean; cdecl;
  jsToInt: function(es: jsExecState; v: jsValue): Integer; cdecl;
  jsToFloat: function(es: jsExecState; v: jsValue): Single; cdecl;
  jsToDouble: function(es: jsExecState; v: jsValue): Double; cdecl;
  jsToBoolean: function(es: jsExecState; v: jsValue): Boolean; cdecl;
  jsToTempString: function(es: jsExecState; v: jsValue): putf8; cdecl;
  jsToTempStringW: function(es: jsExecState; v: jsValue): pwchar_t; cdecl;
  jsInt: function(n: Integer): jsValue; cdecl;
  jsFloat: function(f: Single): jsValue; cdecl;
  jsDouble: function(d: Double): jsValue; cdecl;
  jsBoolean: function(b: Boolean): jsValue; cdecl;
  jsUndefined: function(): jsValue; cdecl;
  jsNull: function(): jsValue; cdecl;
  jsTrue: function(): jsValue; cdecl;
  jsFalse: function(): jsValue; cdecl;
  jsString: function(es: jsExecState; str: Putf8): jsValue; cdecl;
  jsStringW: function(es: jsExecState; str: Pwchar_t): jsValue; cdecl;
  jsEmptyObject: function(es: jsExecState): jsValue; cdecl;
  jsEmptyArray: function(es: jsExecState): jsValue; cdecl;
  jsObject: function(es: jsExecState; obj: PjsData): jsValue; cdecl;
  jsFunction: function(es: jsExecState; obj: PjsData): jsValue; cdecl;
  jsGetData: function(es: jsExecState; AObject: jsValue): pjsData; cdecl;  //2019.05.09 ¸Äpjsdata
  jsGet: function(es: jsExecState; AObject: jsValue; prop: PAnsiChar): jsValue; cdecl;
  jsSet: procedure(es: jsExecState; AObject: jsValue; prop: PAnsiChar; v: jsValue); cdecl;
  jsGetAt: function(es: jsExecState; AObject: jsValue; index: Integer): jsValue; cdecl;
  jsSetAt: procedure(es: jsExecState; AObject: jsValue; index: Integer; v: jsValue); cdecl;
  jsGetLength: function(es: jsExecState; AObject: jsValue): Integer; cdecl;
  jsSetLength: procedure(es: jsExecState; AObject: jsValue; length: Integer); cdecl;
  jsGlobalObject: function(es: jsExecState): jsValue; cdecl;
  jsGetWebView: function(es: jsExecState): wkeWebView; cdecl;
  jsEval: function(es: jsExecState; str: Putf8): jsValue; cdecl;
  jsEvalW: function(es: jsExecState; str: Pwchar_t): jsValue; cdecl;
  jsCall: function(es: jsExecState; func: jsValue; thisObject: jsValue; args: PjsValue; argCount: Integer): jsValue; cdecl;
  jsCallGlobal: function(es: jsExecState; func: jsValue; args: PjsValue; argCount: Integer): jsValue; cdecl;
  jsGetGlobal: function(es: jsExecState; prop: PAnsiChar): jsValue; cdecl;
  jsSetGlobal: procedure(es: jsExecState; prop: PAnsiChar; v: jsValue); cdecl;
  jsGC: procedure(); cdecl;


{$IFDEF UseVcFastCall}
procedure ProcessVcFastCall;
{$ENDIF UseVcFastCall}

function LoadWkeLibaraly(const wkeLibFilePath: string = ''): boolean;

procedure UnLoadWkeLibaraly();

function WkeLoadLibAndInit: boolean;

procedure WkeFinalizeAndUnloadLib;

implementation

uses  //  dialogs,
  math;


{$IFDEF UseVcFastCall}
   // ±ØÐë·ÅÔÚº¯Êý¿ªÊ¼µÄµÚÒ»ÐÐÎ»ÖÃ£¬·ñÔò»áÆÆ»µecx¼Ä´æÆ÷
procedure ProcessVcFastCall;
asm
   {$IFDEF DEBUG}
        MOV     [EBP - 4], ECX
   {$ELSE}
        MOV     EBX, ECX
   {$ENDIF DEBUG}
end;
{$ENDIF UseVcFastCall}

function WkeLoadLibAndInit: boolean;
begin
  result := false;

  //Èç¹ûÊÇfastmb
  if UseFastMB then
  begin
    result := mbUserInit;
    exit;
  end;

  if wkeLibHandle = 0 then
  begin

    if LoadWkeLibaraly() then
    begin
      wkeInitialize;
      if wkePluginDir <> '' then
        wkeAddPluginDirectory(nil, PWideChar(WideString(wkePluginDir)));
      result := true;
    end;
  end;
end;

procedure WkeFinalizeAndUnloadLib;
begin
  if UseFastMB then
  begin
    mbUserUninit;
    exit;
  end;

  if wkeLibHandle <> 0 then
  begin
    wkeFinalize;
    UnLoadWkeLibaraly;
  end;
end;

function LoadWkeLibaraly(const wkeLibFilePath: string = ''): boolean;
begin
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  result := false;

  wkeLibHandle := GetModuleHandle(PChar(ExtractFileName(wkeLibFileName)));
  if wkeLibHandle = 0 then
  begin
    if (wkeLibFilePath <> '') and Fileexists(wkeLibFilePath) then
      wkeLibFileName := wkeLibFilePath;
    if Fileexists(wkeLibFileName) then
      wkeLibHandle := LoadLibrary(PChar(wkeLibFileName));
  end;

  if wkeLibHandle = 0 then
    raise Exception.Create('Load wke.dll Error,Please check the file!');
  //  RaiseLastOSError;

  wkeInitialize := GetProcAddress(wkeLibHandle, 'wkeInitialize');
  wkeInitializeEx := GetProcAddress(wkeLibHandle, 'wkeInitializeEx');
  wkeConfigure := GetProcAddress(wkeLibHandle, 'wkeConfigure');
  wkeFinalize := GetProcAddress(wkeLibHandle, 'wkeFinalize');
  wkeUpdate := GetProcAddress(wkeLibHandle, 'wkeUpdate');
  wkeGetVersion := GetProcAddress(wkeLibHandle, 'wkeGetVersion');
  wkeGetVersionString := GetProcAddress(wkeLibHandle, 'wkeGetVersionString');
  wkeSetFileSystem := GetProcAddress(wkeLibHandle, 'wkeSetFileSystem');
  wkeCreateWebView := GetProcAddress(wkeLibHandle, 'wkeCreateWebView');
  wkeGetWebView := GetProcAddress(wkeLibHandle, 'wkeGetWebView');
  wkeDestroyWebView := GetProcAddress(wkeLibHandle, 'wkeDestroyWebView');
  wkeGetName := GetProcAddress(wkeLibHandle, 'wkeGetName');
  wkeSetName := GetProcAddress(wkeLibHandle, 'wkeSetName');
  wkeIsTransparent := GetProcAddress(wkeLibHandle, 'wkeIsTransparent');
  wkeSetTransparent := GetProcAddress(wkeLibHandle, 'wkeSetTransparent');
  wkeSetUserAgent := GetProcAddress(wkeLibHandle, 'wkeSetUserAgent');
  wkeSetUserAgentW := GetProcAddress(wkeLibHandle, 'wkeSetUserAgentW');
  wkeLoadURL := GetProcAddress(wkeLibHandle, 'wkeLoadURL');
  wkeLoadURLW := GetProcAddress(wkeLibHandle, 'wkeLoadURLW');
  wkePostURL := GetProcAddress(wkeLibHandle, 'wkePostURL');
  wkePostURLW := GetProcAddress(wkeLibHandle, 'wkePostURLW');
  wkeLoadHTML := GetProcAddress(wkeLibHandle, 'wkeLoadHTML');
  wkeLoadHTMLW := GetProcAddress(wkeLibHandle, 'wkeLoadHTMLW');
  wkeLoadFile := GetProcAddress(wkeLibHandle, 'wkeLoadFile');
  wkeLoadFileW := GetProcAddress(wkeLibHandle, 'wkeLoadFileW');
  wkeLoad := GetProcAddress(wkeLibHandle, 'wkeLoad');
  wkeLoadW := GetProcAddress(wkeLibHandle, 'wkeLoadW');
  wkeIsLoading := GetProcAddress(wkeLibHandle, 'wkeIsLoading');
  wkeIsLoadingSucceeded := GetProcAddress(wkeLibHandle, 'wkeIsLoadingSucceeded');
  wkeIsLoadingFailed := GetProcAddress(wkeLibHandle, 'wkeIsLoadingFailed');
  wkeIsLoadingCompleted := GetProcAddress(wkeLibHandle, 'wkeIsLoadingCompleted');
  wkeIsDocumentReady := GetProcAddress(wkeLibHandle, 'wkeIsDocumentReady');
  wkeStopLoading := GetProcAddress(wkeLibHandle, 'wkeStopLoading');
  wkeReload := GetProcAddress(wkeLibHandle, 'wkeReload');
  wkeGetTitle := GetProcAddress(wkeLibHandle, 'wkeGetTitle');
  wkeGetTitleW := GetProcAddress(wkeLibHandle, 'wkeGetTitleW');
  wkeResize := GetProcAddress(wkeLibHandle, 'wkeResize');
  wkeGetWidth := GetProcAddress(wkeLibHandle, 'wkeGetWidth');
  wkeGetHeight := GetProcAddress(wkeLibHandle, 'wkeGetHeight');
  wkeGetContentWidth := GetProcAddress(wkeLibHandle, 'wkeGetContentWidth');
  wkeGetContentHeight := GetProcAddress(wkeLibHandle, 'wkeGetContentHeight');
  wkeSetDirty := GetProcAddress(wkeLibHandle, 'wkeSetDirty');
  wkeIsDirty := GetProcAddress(wkeLibHandle, 'wkeIsDirty');
  wkeAddDirtyArea := GetProcAddress(wkeLibHandle, 'wkeAddDirtyArea');
  wkeLayoutIfNeeded := GetProcAddress(wkeLibHandle, 'wkeLayoutIfNeeded');
  wkePaint := GetProcAddress(wkeLibHandle, 'wkePaint');
  wkePaint2 := GetProcAddress(wkeLibHandle, 'wkePaint2');
  wkeRepaintIfNeeded := GetProcAddress(wkeLibHandle, 'wkeRepaintIfNeeded');
  wkeGetViewDC := GetProcAddress(wkeLibHandle, 'wkeGetViewDC');
  wkeCanGoBack := GetProcAddress(wkeLibHandle, 'wkeCanGoBack');
  wkeGoBack := GetProcAddress(wkeLibHandle, 'wkeGoBack');
  wkeCanGoForward := GetProcAddress(wkeLibHandle, 'wkeCanGoForward');
  wkeGoForward := GetProcAddress(wkeLibHandle, 'wkeGoForward');
  wkeEditorSelectAll := GetProcAddress(wkeLibHandle, 'wkeEditorSelectAll');
  wkeEditorCopy := GetProcAddress(wkeLibHandle, 'wkeEditorCopy');
  wkeEditorCut := GetProcAddress(wkeLibHandle, 'wkeEditorCut');
  wkeEditorPaste := GetProcAddress(wkeLibHandle, 'wkeEditorPaste');
  wkeEditorDelete := GetProcAddress(wkeLibHandle, 'wkeEditorDelete');
  wkeGetCookieW := GetProcAddress(wkeLibHandle, 'wkeGetCookieW');
  wkeGetCookie := GetProcAddress(wkeLibHandle, 'wkeGetCookie');
  wkeSetCookieEnabled := GetProcAddress(wkeLibHandle, 'wkeSetCookieEnabled');
  wkeIsCookieEnabled := GetProcAddress(wkeLibHandle, 'wkeIsCookieEnabled');
  wkeSetMediaVolume := GetProcAddress(wkeLibHandle, 'wkeSetMediaVolume');
  wkeGetMediaVolume := GetProcAddress(wkeLibHandle, 'wkeGetMediaVolume');
  wkeFireMouseEvent := GetProcAddress(wkeLibHandle, 'wkeFireMouseEvent');
  wkeFireContextMenuEvent := GetProcAddress(wkeLibHandle, 'wkeFireContextMenuEvent');
  wkeFireMouseWheelEvent := GetProcAddress(wkeLibHandle, 'wkeFireMouseWheelEvent');
  wkeFireKeyUpEvent := GetProcAddress(wkeLibHandle, 'wkeFireKeyUpEvent');
  wkeFireKeyDownEvent := GetProcAddress(wkeLibHandle, 'wkeFireKeyDownEvent');
  wkeFireKeyPressEvent := GetProcAddress(wkeLibHandle, 'wkeFireKeyPressEvent');
  wkeSetFocus := GetProcAddress(wkeLibHandle, 'wkeSetFocus');
  wkeKillFocus := GetProcAddress(wkeLibHandle, 'wkeKillFocus');
  wkeGetCaretRect := GetProcAddress(wkeLibHandle, 'wkeGetCaretRect');
  wkeRunJS := GetProcAddress(wkeLibHandle, 'wkeRunJS');
  wkeRunJSW := GetProcAddress(wkeLibHandle, 'wkeRunJSW');
  wkeGlobalExec := GetProcAddress(wkeLibHandle, 'wkeGlobalExec');
  wkeSleep := GetProcAddress(wkeLibHandle, 'wkeSleep');
  wkeWake := GetProcAddress(wkeLibHandle, 'wkeWake');
  wkeIsAwake := GetProcAddress(wkeLibHandle, 'wkeIsAwake');
  wkeSetZoomFactor := GetProcAddress(wkeLibHandle, 'wkeSetZoomFactor');
  wkeGetZoomFactor := GetProcAddress(wkeLibHandle, 'wkeGetZoomFactor');
  wkeSetEditable := GetProcAddress(wkeLibHandle, 'wkeSetEditable');
  wkeGetString := GetProcAddress(wkeLibHandle, 'wkeGetString');
  wkeGetStringW := GetProcAddress(wkeLibHandle, 'wkeGetStringW');
  wkeSetString := GetProcAddress(wkeLibHandle, 'wkeSetString');
  wkeSetStringW := GetProcAddress(wkeLibHandle, 'wkeSetStringW');
  wkeOnTitleChanged := GetProcAddress(wkeLibHandle, 'wkeOnTitleChanged');
  wkeOnURLChanged := GetProcAddress(wkeLibHandle, 'wkeOnURLChanged');
  wkeOnPaintUpdated := GetProcAddress(wkeLibHandle, 'wkeOnPaintUpdated');
  wkeOnAlertBox := GetProcAddress(wkeLibHandle, 'wkeOnAlertBox');
  wkeOnConfirmBox := GetProcAddress(wkeLibHandle, 'wkeOnConfirmBox');
  wkeOnPromptBox := GetProcAddress(wkeLibHandle, 'wkeOnPromptBox');
  wkeOnNavigation := GetProcAddress(wkeLibHandle, 'wkeOnNavigation');
  wkeOnCreateView := GetProcAddress(wkeLibHandle, 'wkeOnCreateView');
  wkeOnDocumentReady := GetProcAddress(wkeLibHandle, 'wkeOnDocumentReady');
  wkeOnLoadingFinish := GetProcAddress(wkeLibHandle, 'wkeOnLoadingFinish');
//  wkeOnConsoleMessage := GetProcAddress(wkeLibHandle, 'wkeOnConsoleMessage');
  wkeOnConsoleMessage := GetProcAddress(wkeLibHandle, 'wkeOnConsole');
  wkeCreateWebWindow := GetProcAddress(wkeLibHandle, 'wkeCreateWebWindow');
  wkeDestroyWebWindow := GetProcAddress(wkeLibHandle, 'wkeDestroyWebWindow');
  wkeGetWindowHandle := GetProcAddress(wkeLibHandle, 'wkeGetWindowHandle');
  wkeOnWindowClosing := GetProcAddress(wkeLibHandle, 'wkeOnWindowClosing');
  wkeOnWindowDestroy := GetProcAddress(wkeLibHandle, 'wkeOnWindowDestroy');
  wkeShowWindow := GetProcAddress(wkeLibHandle, 'wkeShowWindow');
  wkeEnableWindow := GetProcAddress(wkeLibHandle, 'wkeEnableWindow');
  wkeMoveWindow := GetProcAddress(wkeLibHandle, 'wkeMoveWindow');
  wkeMoveToCenter := GetProcAddress(wkeLibHandle, 'wkeMoveToCenter');
  wkeResizeWindow := GetProcAddress(wkeLibHandle, 'wkeResizeWindow');
  wkeSetWindowTitle := GetProcAddress(wkeLibHandle, 'wkeSetWindowTitle');
  wkeSetWindowTitleW := GetProcAddress(wkeLibHandle, 'wkeSetWindowTitleW');

  wkeSetCookieJarPath := GetProcAddress(wkeLibHandle, 'wkeSetCookieJarPath');
  wkeSetCookie := GetProcAddress(wkeLibHandle, 'wkeSetCookie');
  wkeGetURL := GetProcAddress(wkeLibHandle, 'wkeGetURL');
  wkeWebFrameGetMainFrame := GetProcAddress(wkeLibHandle, 'wkeWebFrameGetMainFrame');
  wkeIsMainFrame := GetProcAddress(wkeLibHandle, 'wkeIsMainFrame');
  wkeRunJsByFrame := GetProcAddress(wkeLibHandle, 'wkeRunJsByFrame');

  wkeVisitAllCookie := GetProcAddress(wkeLibHandle, 'wkeVisitAllCookie');
  wkeSetLocalStorageFullPath := GetProcAddress(wkeLibHandle, 'wkeSetLocalStorageFullPath');
  wkePerformCookieCommand := GetProcAddress(wkeLibHandle, 'wkePerformCookieCommand');
  //2018.02.07
  wkeSetHeadlessEnabled := GetProcAddress(wkeLibHandle, 'wkeSetHeadlessEnabled');
  wkeSetTouchEnabled := GetProcAddress(wkeLibHandle, 'wkeSetTouchEnabled');
  wkeSetUIThreadCallback := GetProcAddress(wkeLibHandle, 'wkeSetUIThreadCallback');
  wkeOnLoadUrlBegin := GetProcAddress(wkeLibHandle, 'wkeOnLoadUrlBegin');
  wkeOnLoadUrlEnd := GetProcAddress(wkeLibHandle, 'wkeOnLoadUrlEnd');
  wkeOnDownload := GetProcAddress(wkeLibHandle, 'wkeOnDownload');
  wkeOnDocumentReady2 := GetProcAddress(wkeLibHandle, 'wkeOnDocumentReady2');
  wkeOnURLChanged2 := GetProcAddress(wkeLibHandle, 'wkeOnURLChanged2');
  wkeSetProxy := GetProcAddress(wkeLibHandle, 'wkeSetProxy');
  wkeSetViewProxy := GetProcAddress(wkeLibHandle, 'wkeSetViewProxy');


  //2018.3.14
  wkeSetDebugConfig := GetProcAddress(wkeLibHandle, 'wkeSetDebugConfig');
  wkeSetDragEnable := GetProcAddress(wkeLibHandle, 'wkeSetDragEnable');
  wkeOnMouseOverUrlChanged := GetProcAddress(wkeLibHandle, 'wkeOnMouseOverUrlChanged');
  //2018.5.29
  wkeSetDeviceParameter := GetProcAddress(wkeLibHandle, 'wkeSetDeviceParameter');
  wkeAddPluginDirectory := GetProcAddress(wkeLibHandle, 'wkeAddPluginDirectory');
  wkeGetSource := GetProcAddress(wkeLibHandle, 'wkeGetSource');
  wkeNetHookRequest := GetProcAddress(wkeLibHandle, 'wkeNetHookRequest');
  wkeSetNavigationToNewWindowEnable := GetProcAddress(wkeLibHandle, 'wkeSetNavigationToNewWindowEnable');
  wkeNetSetHTTPHeaderField := GetProcAddress(wkeLibHandle, 'wkeNetSetHTTPHeaderField');

  wkeSetCspCheckEnable := GetProcAddress(wkeLibHandle, 'wkeSetCspCheckEnable');
  wkeCreateWebCustomWindow   := GetProcAddress(wkeLibHandle, 'wkeCreateWebCustomWindow');
  wkeUtilSerializeToMHTML   := GetProcAddress(wkeLibHandle, 'wkeUtilSerializeToMHTML');
  jsBindFunction := GetProcAddress(wkeLibHandle, 'jsBindFunction');
  jsBindGetter := GetProcAddress(wkeLibHandle, 'jsBindGetter');
  jsBindSetter := GetProcAddress(wkeLibHandle, 'jsBindSetter');
  jsArgCount := GetProcAddress(wkeLibHandle, 'jsArgCount');
  jsArgType := GetProcAddress(wkeLibHandle, 'jsArgType');
  jsArg := GetProcAddress(wkeLibHandle, 'jsArg');
  jsTypeOf := GetProcAddress(wkeLibHandle, 'jsTypeOf');
  jsIsNumber := GetProcAddress(wkeLibHandle, 'jsIsNumber');
  jsIsString := GetProcAddress(wkeLibHandle, 'jsIsString');
  jsIsBoolean := GetProcAddress(wkeLibHandle, 'jsIsBoolean');
  jsIsObject := GetProcAddress(wkeLibHandle, 'jsIsObject');
  jsIsFunction := GetProcAddress(wkeLibHandle, 'jsIsFunction');
  jsIsUndefined := GetProcAddress(wkeLibHandle, 'jsIsUndefined');
  jsIsNull := GetProcAddress(wkeLibHandle, 'jsIsNull');
  jsIsArray := GetProcAddress(wkeLibHandle, 'jsIsArray');
  jsIsTrue := GetProcAddress(wkeLibHandle, 'jsIsTrue');
  jsIsFalse := GetProcAddress(wkeLibHandle, 'jsIsFalse');
  jsToInt := GetProcAddress(wkeLibHandle, 'jsToInt');
  jsToFloat := GetProcAddress(wkeLibHandle, 'jsToFloat');
  jsToDouble := GetProcAddress(wkeLibHandle, 'jsToDouble');
  jsToBoolean := GetProcAddress(wkeLibHandle, 'jsToBoolean');
  jsToTempString := GetProcAddress(wkeLibHandle, 'jsToTempString');
  jsToTempStringW := GetProcAddress(wkeLibHandle, 'jsToTempStringW');
  jsInt := GetProcAddress(wkeLibHandle, 'jsInt');
  jsFloat := GetProcAddress(wkeLibHandle, 'jsFloat');
  jsDouble := GetProcAddress(wkeLibHandle, 'jsDouble');
  jsBoolean := GetProcAddress(wkeLibHandle, 'jsBoolean');
  jsUndefined := GetProcAddress(wkeLibHandle, 'jsUndefined');
  jsNull := GetProcAddress(wkeLibHandle, 'jsNull');
  jsTrue := GetProcAddress(wkeLibHandle, 'jsTrue');
  jsFalse := GetProcAddress(wkeLibHandle, 'jsFalse');
  jsString := GetProcAddress(wkeLibHandle, 'jsString');
  jsStringW := GetProcAddress(wkeLibHandle, 'jsStringW');
  jsEmptyObject := GetProcAddress(wkeLibHandle, 'jsEmptyObject');
  jsEmptyArray := GetProcAddress(wkeLibHandle, 'jsEmptyArray');
  jsObject := GetProcAddress(wkeLibHandle, 'jsObject');
  jsFunction := GetProcAddress(wkeLibHandle, 'jsFunction');
  jsGetData := GetProcAddress(wkeLibHandle, 'jsGetData');
  jsGet := GetProcAddress(wkeLibHandle, 'jsGet');
  jsSet := GetProcAddress(wkeLibHandle, 'jsSet');
  jsGetAt := GetProcAddress(wkeLibHandle, 'jsGetAt');
  jsSetAt := GetProcAddress(wkeLibHandle, 'jsSetAt');
  jsGetLength := GetProcAddress(wkeLibHandle, 'jsGetLength');
  jsSetLength := GetProcAddress(wkeLibHandle, 'jsSetLength');
  jsGlobalObject := GetProcAddress(wkeLibHandle, 'jsGlobalObject');
  jsGetWebView := GetProcAddress(wkeLibHandle, 'jsGetWebView');
  jsEval := GetProcAddress(wkeLibHandle, 'jsEval');
  jsEvalW := GetProcAddress(wkeLibHandle, 'jsEvalW');
  jsCall := GetProcAddress(wkeLibHandle, 'jsCall');
  jsCallGlobal := GetProcAddress(wkeLibHandle, 'jsCallGlobal');
  jsGetGlobal := GetProcAddress(wkeLibHandle, 'jsGetGlobal');
  jsSetGlobal := GetProcAddress(wkeLibHandle, 'jsSetGlobal');
  jsGC := GetProcAddress(wkeLibHandle, 'jsGC');

  Result := (wkeLibHandle <> 0);

end;

procedure UnLoadWkeLibaraly();
begin
  if wkeLibHandle > 0 then
  begin
    FreeLibrary(wkeLibHandle);
    wkeLibHandle := 0;
  end;
end;

end.


/*
*
* wolar@qq.com
* http://miniblink.net
* https://github.com/weolar/miniblink49
* licence MIT
*
*/

#ifndef WKE_DEFINE_H
#define WKE_DEFINE_H

#include <windows.h>

//////////////////////////////////////////////////////////////////////////

typedef struct {
    int x;
    int y;
    int w;
    int h;
} wkeRect;

typedef enum {
    WKE_LBUTTON = 0x01,
    WKE_RBUTTON = 0x02,
    WKE_SHIFT = 0x04,
    WKE_CONTROL = 0x08,
    WKE_MBUTTON = 0x10,
} wkeMouseFlags;

typedef enum {
    WKE_EXTENDED = 0x0100,
    WKE_REPEAT = 0x4000,
} wkeKeyFlags;

typedef enum {
    WKE_MSG_MOUSEMOVE = 0x0200,
    WKE_MSG_LBUTTONDOWN = 0x0201,
    WKE_MSG_LBUTTONUP = 0x0202,
    WKE_MSG_LBUTTONDBLCLK = 0x0203,
    WKE_MSG_RBUTTONDOWN = 0x0204,
    WKE_MSG_RBUTTONUP = 0x0205,
    WKE_MSG_RBUTTONDBLCLK = 0x0206,
    WKE_MSG_MBUTTONDOWN = 0x0207,
    WKE_MSG_MBUTTONUP = 0x0208,
    WKE_MSG_MBUTTONDBLCLK = 0x0209,
    WKE_MSG_MOUSEWHEEL = 0x020A,
} wkeMouseMsg;


#if !defined(__cplusplus)
#ifndef HAVE_WCHAR_T
typedef unsigned short wchar_t;
#endif
#endif

#include <stdbool.h>


typedef char utf8;
#if !defined(__cplusplus)
typedef void* jsExecState;
#else
struct JsExecStateInfo;
typedef JsExecStateInfo* jsExecState;
#endif
typedef __int64 jsValue;

#if defined(__cplusplus)
namespace wke { class CWebView; };
typedef wke::CWebView* wkeWebView;

namespace wke { class CString; };
typedef wke::CString* wkeString;

#else
struct _tagWkeWebView;
typedef struct _tagWkeWebView* wkeWebView;

struct _tagWkeString;
typedef struct _tagWkeString* wkeString;
#endif

typedef enum {
    WKE_PROXY_NONE,
    WKE_PROXY_HTTP,
    WKE_PROXY_SOCKS4,
    WKE_PROXY_SOCKS4A,
    WKE_PROXY_SOCKS5,
    WKE_PROXY_SOCKS5HOSTNAME
} wkeProxyType;

typedef struct {
    wkeProxyType type;
    char hostname[100];
    unsigned short port;
    char username[50];
    char password[50];
} wkeProxy;

enum wkeSettingMask {
    WKE_SETTING_PROXY = 1,
    WKE_SETTING_PAINTCALLBACK_IN_OTHER_THREAD = 1 << 2,
};

typedef struct {
    wkeProxy proxy;
    unsigned int mask;
} wkeSettings;

typedef struct {
    int size;
    unsigned int bgColor;
} wkeViewSettings;

typedef void* wkeWebFrameHandle;

typedef void* (*FILE_OPEN_) (const char* path);
typedef void(*FILE_CLOSE_) (void* handle);
typedef size_t(*FILE_SIZE) (void* handle);
typedef int(*FILE_READ) (void* handle, void* buffer, size_t size);
typedef int(*FILE_SEEK) (void* handle, int offset, int origin);

typedef FILE_OPEN_ WKE_FILE_OPEN;
typedef FILE_CLOSE_ WKE_FILE_CLOSE;
typedef FILE_SIZE WKE_FILE_SIZE;
typedef FILE_READ WKE_FILE_READ;
typedef FILE_SEEK WKE_FILE_SEEK;
typedef bool(*WKE_EXISTS_FILE)(const char * path);

struct _wkeClientHandler; // declare warning fix
typedef void(*ON_TITLE_CHANGED) (const struct _wkeClientHandler* clientHandler, const wkeString title);
typedef void(*ON_URL_CHANGED) (const struct _wkeClientHandler* clientHandler, const wkeString url);

typedef struct _wkeClientHandler {
    ON_TITLE_CHANGED onTitleChanged;
    ON_URL_CHANGED onURLChanged;
} wkeClientHandler;

typedef bool(*wkeCookieVisitor)(
    void* params,
    const char* name,
    const char* value,
    const char* domain,
    const char* path, // If |path| is non-empty only URLs at or below the path will get the cookie value.
    int secure, // If |secure| is true the cookie will only be sent for HTTPS requests.
    int httpOnly, // If |httponly| is true the cookie will only be sent for HTTP requests.
    int* expires // The cookie expiration date is only valid if |has_expires| is true.
    );

typedef enum {
    wkeCookieCommandClearAllCookies,
    wkeCookieCommandClearSessionCookies,
    wkeCookieCommandFlushCookiesToFile,
    wkeCookieCommandReloadCookiesFromFile,
} wkeCookieCommand;

typedef enum {
    WKE_NAVIGATION_TYPE_LINKCLICK,
    WKE_NAVIGATION_TYPE_FORMSUBMITTE,
    WKE_NAVIGATION_TYPE_BACKFORWARD,
    WKE_NAVIGATION_TYPE_RELOAD,
    WKE_NAVIGATION_TYPE_FORMRESUBMITT,
    WKE_NAVIGATION_TYPE_OTHER
} wkeNavigationType;

typedef enum {
    WkeCursorInfoPointer,
    WkeCursorInfoCross,
    WkeCursorInfoHand,
    WkeCursorInfoIBeam,
    WkeCursorInfoWait,
    WkeCursorInfoHelp,
    WkeCursorInfoEastResize,
    WkeCursorInfoNorthResize,
    WkeCursorInfoNorthEastResize,
    WkeCursorInfoNorthWestResize,
    WkeCursorInfoSouthResize,
    WkeCursorInfoSouthEastResize,
    WkeCursorInfoSouthWestResize,
    WkeCursorInfoWestResize,
    WkeCursorInfoNorthSouthResize,
    WkeCursorInfoEastWestResize,
    WkeCursorInfoNorthEastSouthWestResize,
    WkeCursorInfoNorthWestSouthEastResize,
    WkeCursorInfoColumnResize,
    WkeCursorInfoRowResize,
    WkeCursorInfoMiddlePanning,
    WkeCursorInfoEastPanning,
    WkeCursorInfoNorthPanning,
    WkeCursorInfoNorthEastPanning,
    WkeCursorInfoNorthWestPanning,
    WkeCursorInfoSouthPanning,
    WkeCursorInfoSouthEastPanning,
    WkeCursorInfoSouthWestPanning,
    WkeCursorInfoWestPanning,
    WkeCursorInfoMove,
    WkeCursorInfoVerticalText,
    WkeCursorInfoCell,
    WkeCursorInfoContextMenu,
    WkeCursorInfoAlias,
    WkeCursorInfoProgress,
    WkeCursorInfoNoDrop,
    WkeCursorInfoCopy,
    WkeCursorInfoNone,
    WkeCursorInfoNotAllowed,
    WkeCursorInfoZoomIn,
    WkeCursorInfoZoomOut,
    WkeCursorInfoGrab,
    WkeCursorInfoGrabbing,
    WkeCursorInfoCustom
} WkeCursorInfoType;

typedef struct {
    int x;
    int y;
    int width;
    int height;

    bool menuBarVisible;
    bool statusBarVisible;
    bool toolBarVisible;
    bool locationBarVisible;
    bool scrollbarsVisible;
    bool resizable;
    bool fullscreen;
} wkeWindowFeatures;

typedef struct {
    struct Item {
        enum wkeStorageType {
            // String data with an associated MIME type. Depending on the MIME type, there may be
            // optional metadata attributes as well.
            StorageTypeString,
            // Stores the name of one file being dragged into the renderer.
            StorageTypeFilename,
            // An image being dragged out of the renderer. Contains a buffer holding the image data
            // as well as the suggested name for saving the image to.
            StorageTypeBinaryData,
            // Stores the filesystem URL of one file being dragged into the renderer.
            StorageTypeFileSystemFile,
        } storageType;

        // Only valid when storageType == StorageTypeString.
        wkeString stringType;
        wkeString stringData;

        // Only valid when storageType == StorageTypeFilename.
        wkeString filenameData;
        wkeString displayNameData;

        // Only valid when storageType == StorageTypeBinaryData.
        char* binaryData;
        int binaryDataLength;

        // Title associated with a link when stringType == "text/uri-list".
        // Filename when storageType == StorageTypeBinaryData.
        wkeString title;

        // Only valid when storageType == StorageTypeFileSystemFile.
        wkeString fileSystemURL;
        long long fileSystemFileSize;

        // Only valid when stringType == "text/html".
        wkeString baseURL;
    };

    struct Item* m_itemList;
    int m_itemListLength;

    int m_modifierKeyState; // State of Shift/Ctrl/Alt/Meta keys.
    wkeString m_filesystemId;
} wkeWebDragData;

typedef enum {
    wkeWebDragOperationNone = 0,
    wkeWebDragOperationCopy = 1,
    wkeWebDragOperationLink = 2,
    wkeWebDragOperationGeneric = 4,
    wkeWebDragOperationPrivate = 8,
    wkeWebDragOperationMove = 16,
    wkeWebDragOperationDelete = 32,
    wkeWebDragOperationEvery = 0xffffffff
} wkeWebDragOperation;

typedef wkeWebDragOperation wkeWebDragOperationsMask;

typedef enum {
    WKE_RESOURCE_TYPE_MAIN_FRAME = 0,       // top level page
    WKE_RESOURCE_TYPE_SUB_FRAME = 1,        // frame or iframe
    WKE_RESOURCE_TYPE_STYLESHEET = 2,       // a CSS stylesheet
    WKE_RESOURCE_TYPE_SCRIPT = 3,           // an external script
    WKE_RESOURCE_TYPE_IMAGE = 4,            // an image (jpg/gif/png/etc)
    WKE_RESOURCE_TYPE_FONT_RESOURCE = 5,    // a font
    WKE_RESOURCE_TYPE_SUB_RESOURCE = 6,     // an "other" subresource.
    WKE_RESOURCE_TYPE_OBJECT = 7,           // an object (or embed) tag for a plugin,
                                            // or a resource that a plugin requested.
    WKE_RESOURCE_TYPE_MEDIA = 8,            // a media resource.
    WKE_RESOURCE_TYPE_WORKER = 9,           // the main resource of a dedicated
                                            // worker.
    WKE_RESOURCE_TYPE_SHARED_WORKER = 10,   // the main resource of a shared worker.
    WKE_RESOURCE_TYPE_PREFETCH = 11,        // an explicitly requested prefetch
    WKE_RESOURCE_TYPE_FAVICON = 12,         // a favicon
    WKE_RESOURCE_TYPE_XHR = 13,             // a XMLHttpRequest
    WKE_RESOURCE_TYPE_PING = 14,            // a ping request for <a ping>
    WKE_RESOURCE_TYPE_SERVICE_WORKER = 15,  // the main resource of a service worker.
    WKE_RESOURCE_TYPE_LAST_TYPE
} wkeResourceType;

typedef struct {
    bool isHolded;
    wkeString url;
    wkeString newUrl;
    wkeResourceType resourceType;
    int httpResponseCode;
    wkeString method;
    wkeString referrer;
    void* headers;
} wkeWillSendRequestInfo;

typedef struct {
    int size;
    wkeWebFrameHandle frame;
    wkeWillSendRequestInfo* willSendRequestInfo;
} wkeTempCallbackInfo;

typedef void(*wkeTitleChangedCallback)(wkeWebView webView, void* param, const wkeString title);
typedef void(*wkeURLChangedCallback)(wkeWebView webView, void* param, const wkeString url);
typedef void(*wkeURLChangedCallback2)(wkeWebView webView, void* param, wkeWebFrameHandle frameId, const wkeString url);
typedef void(*wkePaintUpdatedCallback)(wkeWebView webView, void* param, const HDC hdc, int x, int y, int cx, int cy);
typedef void(*wkeAlertBoxCallback)(wkeWebView webView, void* param, const wkeString msg);
typedef bool(*wkeConfirmBoxCallback)(wkeWebView webView, void* param, const wkeString msg);
typedef bool(*wkePromptBoxCallback)(wkeWebView webView, void* param, const wkeString msg, const wkeString defaultResult, wkeString result);
typedef bool(*wkeNavigationCallback)(wkeWebView webView, void* param, wkeNavigationType navigationType, const wkeString url);
typedef wkeWebView(*wkeCreateViewCallback)(wkeWebView webView, void* param, wkeNavigationType navigationType, const wkeString url, const wkeWindowFeatures* windowFeatures);
typedef void(*wkeDocumentReadyCallback)(wkeWebView webView, void* param);
typedef void(*wkeDocumentReady2Callback)(wkeWebView webView, void* param, wkeWebFrameHandle frameId);

typedef wkeWebView(*wkeCreateViewCallback)(wkeWebView webView, void* param, wkeNavigationType navigationType, const wkeString url, const wkeWindowFeatures* windowFeatures);
typedef void(*wkeDocumentReadyCallback)(wkeWebView webView, void* param);
typedef void(*wkeDocumentReady2Callback)(wkeWebView webView, void* param, wkeWebFrameHandle frameId);

typedef struct {
    int size;
    int width;
    int height;
    double duration;
} wkeMediaLoadInfo;
typedef void(*wkeWillMediaLoadCallback)(wkeWebView webView, void* param, const char* url, wkeMediaLoadInfo* info);

typedef enum {
    WKE_DID_START_LOADING,
    WKE_DID_STOP_LOADING,
    WKE_DID_NAVIGATE,
    WKE_DID_NAVIGATE_IN_PAGE,
    WKE_DID_GET_RESPONSE_DETAILS,
    WKE_DID_GET_REDIRECT_REQUEST,
} wkeOtherLoadType;
typedef void(*wkeOnOtherLoadCallback)(wkeWebView webView, void* param, wkeOtherLoadType type, wkeTempCallbackInfo* info);

typedef enum {
    WKE_LOADING_SUCCEEDED,
    WKE_LOADING_FAILED,
    WKE_LOADING_CANCELED
} wkeLoadingResult;

typedef void(*wkeLoadingFinishCallback)(wkeWebView webView, void* param, const wkeString url, wkeLoadingResult result, const wkeString failedReason);
typedef bool(*wkeDownloadCallback)(wkeWebView webView, void* param, const char* url);

typedef enum {
    wkeLevelDebug = 4,
    wkeLevelLog = 1,
    wkeLevelInfo = 5,
    wkeLevelWarning = 2,
    wkeLevelError = 3,
    wkeLevelRevokedError = 6,
    wkeLevelLast = wkeLevelInfo
} wkeConsoleLevel;
typedef void(*wkeConsoleCallback)(wkeWebView webView, void* param, wkeConsoleLevel level, const wkeString message, const wkeString sourceName, unsigned sourceLine, const wkeString stackTrace);

typedef void(*wkeOnCallUiThread)(wkeWebView webView, void* paramOnInThread);
typedef void(*wkeCallUiThread)(wkeWebView webView, wkeOnCallUiThread func, void* param);

//wkeNet--------------------------------------------------------------------------------------
typedef bool(*wkeLoadUrlBeginCallback)(wkeWebView webView, void* param, const char *url, void *job);
typedef void(*wkeLoadUrlEndCallback)(wkeWebView webView, void* param, const char *url, void *job, void* buf, int len);
typedef void(*wkeDidCreateScriptContextCallback)(wkeWebView webView, void* param, wkeWebFrameHandle frameId, void* context, int extensionGroup, int worldId);
typedef void(*wkeWillReleaseScriptContextCallback)(wkeWebView webView, void* param, wkeWebFrameHandle frameId, void* context, int worldId);
typedef bool(*wkeNetResponseCallback)(wkeWebView webView, void* param, const char* url, void* job);

typedef void* v8ContextPtr;
typedef void* v8Isolate;

//wkewindow-----------------------------------------------------------------------------------
typedef enum {
    WKE_WINDOW_TYPE_POPUP,
    WKE_WINDOW_TYPE_TRANSPARENT,
    WKE_WINDOW_TYPE_CONTROL

} wkeWindowType;

typedef bool(*wkeWindowClosingCallback)(wkeWebView webWindow, void* param);
typedef void(*wkeWindowDestroyCallback)(wkeWebView webWindow, void* param);

typedef struct {
    RECT bounds;
    bool draggable;
} wkeDraggableRegion;
typedef void(*wkeDraggableRegionsChangedCallback)(wkeWebView webWindow, void* param, const wkeDraggableRegion* rects, int rectCount);

//JavaScript Bind-----------------------------------------------------------------------------------
#define JS_CALL __fastcall
typedef jsValue(JS_CALL* jsNativeFunction) (jsExecState es);

typedef jsValue(*wkeJsNativeFunction) (jsExecState es, void* param);

typedef enum {
    JSTYPE_NUMBER,
    JSTYPE_STRING,
    JSTYPE_BOOLEAN,
    JSTYPE_OBJECT,
    JSTYPE_FUNCTION,
    JSTYPE_UNDEFINED,
    JSTYPE_ARRAY,
} jsType;

// cexer JS对象、函数绑定支持
typedef jsValue(*jsGetPropertyCallback)(jsExecState es, jsValue object, const char* propertyName);
typedef bool(*jsSetPropertyCallback)(jsExecState es, jsValue object, const char* propertyName, jsValue value);
typedef jsValue(*jsCallAsFunctionCallback)(jsExecState es, jsValue object, jsValue* args, int argCount);
struct tagjsData; // declare warning fix
typedef void(*jsFinalizeCallback)(struct tagjsData* data);

typedef struct tagjsData {
    char typeName[100];
    jsGetPropertyCallback propertyGet;
    jsSetPropertyCallback propertySet;
    jsFinalizeCallback finalize;
    jsCallAsFunctionCallback callAsFunction;
} jsData;


#if defined(__cplusplus)
namespace wke {

class IWebView {
public:
    virtual void destroy() = 0;

    virtual const char* name() const = 0;
    virtual void setName(const char* name) = 0;

    virtual bool isTransparent() const = 0;
    virtual void setTransparent(bool transparent) = 0;

    virtual void loadURL(const utf8* url) = 0;
    virtual void loadURL(const wchar_t* url) = 0;

    virtual void loadHTML(const utf8* html) = 0;
    virtual void loadHTML(const wchar_t* html) = 0;

    virtual void loadFile(const utf8* filename) = 0;
    virtual void loadFile(const wchar_t* filename) = 0;

    virtual const utf8* url() const = 0;

    virtual bool isLoading() const = 0;        /*document load sucessed*/
    virtual bool isLoadingFailed() const = 0;    /*document load failed*/
    virtual bool isLoadingSucceeded() const = 0;  /*document load complete*/
    virtual bool isDocumentReady() const = 0; /*document ready*/
    virtual void stopLoading() = 0;
    virtual void reload() = 0;

    virtual const utf8* title() = 0;
    virtual const wchar_t* titleW() = 0;

    virtual void resize(int w, int h) = 0;
    virtual int width() const = 0;   /*viewport width*/
    virtual int height() const = 0;  /*viewport height*/

    virtual int contentsWidth() const = 0;  /*contents width*/
    virtual int contentsHeight() const = 0; /*contents height*/

    virtual void setDirty(bool dirty) = 0;
    virtual bool isDirty() const = 0;
    virtual void addDirtyArea(int x, int y, int w, int h) = 0;

    virtual void layoutIfNeeded() = 0;
    virtual void paint(void* bits, int pitch) = 0;

    virtual bool canGoBack() const = 0;
    virtual bool goBack() = 0;
    virtual bool canGoForward() const = 0;
    virtual bool goForward() = 0;

    virtual void editorSelectAll() = 0;
    virtual void editorUnSelect() = 0;
    virtual void editorCopy() = 0;
    virtual void editorCut() = 0;
    virtual void editorPaste() = 0;
    virtual void editorDelete() = 0;
    virtual void editorUndo() = 0;
    virtual void editorRedo() = 0;

    virtual void setCookieEnabled(bool enable) = 0;
    virtual bool isCookieEnabled() const = 0;

    virtual void setMediaVolume(float volume) = 0;
    virtual float mediaVolume() const = 0;

    virtual bool fireMouseEvent(unsigned int message, int x, int y, unsigned int flags) = 0;
    virtual bool fireContextMenuEvent(int x, int y, unsigned int flags) = 0;
    virtual bool fireMouseWheelEvent(int x, int y, int delta, unsigned int flags) = 0;
    virtual bool fireKeyUpEvent(unsigned int virtualKeyCode, unsigned int flags, bool systemKey) = 0;
    virtual bool fireKeyDownEvent(unsigned int virtualKeyCode, unsigned int flags, bool systemKey) = 0;
    virtual bool fireKeyPressEvent(unsigned int virtualKeyCode, unsigned int flags, bool systemKey) = 0;

    virtual void setFocus() = 0;
    virtual void killFocus() = 0;

    virtual wkeRect getCaret() = 0;

    virtual jsValue runJS(const utf8* script) = 0;
    virtual jsValue runJS(const wchar_t* script) = 0;
    virtual jsExecState globalExec() = 0;

    virtual void sleep() = 0; //moveOffscreen
    virtual void wake() = 0; //moveOnscreen
    virtual bool isAwake() const = 0;

    virtual void setZoomFactor(float factor) = 0;
    virtual float zoomFactor() const = 0;

    virtual void setEditable(bool editable) = 0;

    virtual void setClientHandler(const wkeClientHandler* handler) = 0;
    virtual const wkeClientHandler* getClientHandler() const = 0;
};

}
#endif

//////////////////////////////////////////////////////////////////////////

#define WKE_CALL_TYPE __cdecl

#define WKE_DEFINE_ITERATOR0(returnVal, name, description) \
    typedef returnVal(WKE_CALL_TYPE* FN_##name)(); \
    __declspec(selectany) FN_##name name = ((FN_##name)0);

#define WKE_DEFINE_ITERATOR1(returnVal, name, p1, description) \
    typedef returnVal(WKE_CALL_TYPE* FN_##name)(p1); \
    __declspec(selectany) FN_##name name = ((FN_##name)0);

#define WKE_DEFINE_ITERATOR2(returnVal, name, p1, p2, description) \
    typedef returnVal(WKE_CALL_TYPE* FN_##name)(p1, p2); \
    __declspec(selectany) FN_##name name = ((FN_##name)0);

#define WKE_DEFINE_ITERATOR3(returnVal, name, p1, p2, p3, description) \
    typedef returnVal(WKE_CALL_TYPE* FN_##name)(p1, p2, p3); \
    __declspec(selectany) FN_##name name = ((FN_##name)0);

#define WKE_DEFINE_ITERATOR4(returnVal, name, p1, p2, p3, p4, description) \
    typedef returnVal(WKE_CALL_TYPE* FN_##name)(p1, p2, p3, p4); \
    __declspec(selectany) FN_##name name = ((FN_##name)0);

#define WKE_DEFINE_ITERATOR5(returnVal, name, p1, p2, p3, p4, p5, description) \
    typedef returnVal(WKE_CALL_TYPE* FN_##name)(p1, p2, p3, p4, p5); \
    __declspec(selectany) FN_##name name = ((FN_##name)0);

#define WKE_DEFINE_ITERATOR6(returnVal, name, p1, p2, p3, p4, p5, p6, description) \
    typedef returnVal(WKE_CALL_TYPE* FN_##name)(p1, p2, p3, p4, p5, p6); \
    __declspec(selectany) FN_##name name = ((FN_##name)0);

#define WKE_DEFINE_ITERATOR11(returnVal, name, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, description) \
    typedef returnVal(WKE_CALL_TYPE* FN_##name)(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11); \
    __declspec(selectany) FN_##name name = ((FN_##name)0);

// ---

#define WKE_DECLARE_ITERATOR0(returnVal, name, description) \
    extern "C" __declspec(dllexport) returnVal WKE_CALL_TYPE name();

#define WKE_DECLARE_ITERATOR1(returnVal, name, p1, description) \
    extern "C" __declspec(dllexport) returnVal WKE_CALL_TYPE name(p1);

#define WKE_DECLARE_ITERATOR2(returnVal, name, p1, p2, description) \
    extern "C" __declspec(dllexport) returnVal WKE_CALL_TYPE name(p1, p2);

#define WKE_DECLARE_ITERATOR3(returnVal, name, p1, p2, p3, description) \
    extern "C" __declspec(dllexport) returnVal WKE_CALL_TYPE name(p1, p2, p3);

#define WKE_DECLARE_ITERATOR4(returnVal, name, p1, p2, p3, p4, description) \
    extern "C" __declspec(dllexport) returnVal WKE_CALL_TYPE name(p1, p2, p3, p4);

#define WKE_DECLARE_ITERATOR5(returnVal, name, p1, p2, p3, p4, p5, description) \
    extern "C" __declspec(dllexport) returnVal WKE_CALL_TYPE name(p1, p2, p3, p4, p5);

#define WKE_DECLARE_ITERATOR6(returnVal, name, p1, p2, p3, p4, p5, p6, description) \
    extern "C" __declspec(dllexport) returnVal WKE_CALL_TYPE name(p1, p2, p3, p4, p5, p6);

#define WKE_DECLARE_ITERATOR11(returnVal, name, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, description) \
    extern "C" __declspec(dllexport) returnVal WKE_CALL_TYPE name(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11);

// ---

#if defined(__cplusplus)
    #define WKE_GET_PTR_ITERATOR(name) \
        name = (FN_##name)::GetProcAddress(hMod, #name); \
        if (!name) \
            MessageBoxA(((HWND)0), "wke api not found", #name, 0);
#else
    #define WKE_GET_PTR_ITERATOR(name) \
        name = (FN_##name)GetProcAddress(hMod, #name); \
        if (!name) \
            MessageBoxA(((HWND)0), "wke api not found", #name, 0);
#endif

#define WKE_GET_PTR_ITERATOR0(returnVal, name, description) \
    WKE_GET_PTR_ITERATOR(name);

#define WKE_GET_PTR_ITERATOR1(returnVal, name, p1, description) \
    WKE_GET_PTR_ITERATOR(name);

#define WKE_GET_PTR_ITERATOR2(returnVal, name, p1, p2, description) \
    WKE_GET_PTR_ITERATOR(name);

#define WKE_GET_PTR_ITERATOR3(returnVal, name, p1, p2, p3, description) \
    WKE_GET_PTR_ITERATOR(name);

#define WKE_GET_PTR_ITERATOR4(returnVal, name, p1, p2, p3, p4, description) \
    WKE_GET_PTR_ITERATOR(name);

#define WKE_GET_PTR_ITERATOR5(returnVal, name, p1, p2, p3, p4, p5, description) \
    WKE_GET_PTR_ITERATOR(name);

#define WKE_GET_PTR_ITERATOR6(returnVal, name, p1, p2, p3, p4, p5, p6, description) \
    WKE_GET_PTR_ITERATOR(name);

#define WKE_GET_PTR_ITERATOR11(returnVal, name, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, description) \
    WKE_GET_PTR_ITERATOR(name);

// 以下是wke的导出函数。格式按照【返回类型】【函数名】【参数】来排列

#define WKE_FOR_EACH_DEFINE_FUNCTION(ITERATOR0, ITERATOR1, ITERATOR2, ITERATOR3, ITERATOR4, ITERATOR5, ITERATOR6, ITERATOR11) \
    ITERATOR0(void, wkeShutdown, "") \
    \
    ITERATOR0(unsigned int, wkeVersion, "") \
    ITERATOR0(const utf8*, wkeVersionString, "") \
    ITERATOR2(void, wkeGC, wkeWebView webView, long delayMs, "") \
    ITERATOR5(void, wkeSetFileSystem, WKE_FILE_OPEN pfnOpen, WKE_FILE_CLOSE pfnClose, WKE_FILE_SIZE pfnSize, WKE_FILE_READ pfnRead, WKE_FILE_SEEK pfnSeek, "") \
    \
    ITERATOR1(const char*, wkeWebViewName, wkeWebView webView, "") \
    ITERATOR2(void, wkeSetWebViewName, wkeWebView webView, const char* name, "") \
    \
    ITERATOR1(bool, wkeIsLoaded, wkeWebView webView, "") \
    ITERATOR1(bool, wkeIsLoadFailed, wkeWebView webView, "") \
    ITERATOR1(bool, wkeIsLoadComplete, wkeWebView webView, "") \
    \
    ITERATOR1(const utf8*, wkeGetSource, wkeWebView webView, "") \
    ITERATOR1(const utf8*, wkeTitle, wkeWebView webView, "") \
    ITERATOR1(const wchar_t*, wkeTitleW, wkeWebView webView, "") \
    ITERATOR1(int, wkeWidth, wkeWebView webView, "") \
    ITERATOR1(int, wkeHeight, wkeWebView webView, "") \
    ITERATOR1(int, wkeContentsWidth, wkeWebView webView, "") \
    ITERATOR1(int, wkeContentsHeight, wkeWebView webView, "") \
    \
    ITERATOR1(void, wkeSelectAll, wkeWebView webView, "") \
    ITERATOR1(void, wkeCopy, wkeWebView webView, "") \
    ITERATOR1(void, wkeCut, wkeWebView webView, "") \
    ITERATOR1(void, wkePaste, wkeWebView webView, "") \
    ITERATOR1(void, wkeDelete, wkeWebView webView, "") \
    \
    ITERATOR1(bool, wkeCookieEnabled, wkeWebView webView, "") \
    ITERATOR1(float, wkeMediaVolume, wkeWebView webView, "") \
    \
    ITERATOR5(bool, wkeMouseEvent, wkeWebView webView, unsigned int message, int x, int y, unsigned int flags, "") \
    ITERATOR4(bool, wkeContextMenuEvent, wkeWebView webView, int x, int y, unsigned int flags, "") \
    ITERATOR5(bool, wkeMouseWheel, wkeWebView webView, int x, int y, int delta, unsigned int flags, "") \
    ITERATOR4(bool, wkeKeyUp, wkeWebView webView, unsigned int virtualKeyCode, unsigned int flags, bool systemKey, "") \
    ITERATOR4(bool, wkeKeyDown, wkeWebView webView, unsigned int virtualKeyCode, unsigned int flags, bool systemKey, "") \
    ITERATOR4(bool, wkeKeyPress, wkeWebView webView, unsigned int virtualKeyCode, unsigned int flags, bool systemKey, "") \
    \
    ITERATOR1(void, wkeFocus, wkeWebView webView, "") \
    ITERATOR1(void, wkeUnfocus, wkeWebView webView, "") \
    \
    ITERATOR1(wkeRect, wkeGetCaret, wkeWebView webView, "") \
    \
    ITERATOR1(void, wkeAwaken, wkeWebView webView, "") \
    \
    ITERATOR1(float, wkeZoomFactor, wkeWebView webView, "") \
    \
    ITERATOR2(void, wkeSetClientHandler, wkeWebView webView, const wkeClientHandler* handler, "") \
    ITERATOR1(const wkeClientHandler*, wkeGetClientHandler, wkeWebView webView, "") \
    \
    ITERATOR1(const utf8*, wkeToString, const wkeString string, "") \
    ITERATOR1(const wchar_t*, wkeToStringW, const wkeString string, "") \
    \
    ITERATOR2(const utf8*, jsToString, jsExecState es, jsValue v, "") \
    ITERATOR2(const wchar_t*, jsToStringW, jsExecState es, jsValue v, "") \
    \
    ITERATOR1(void, wkeConfigure, const wkeSettings* settings, "") \
    ITERATOR0(bool, wkeIsInitialize, "") \
    \
    ITERATOR2(void, wkeSetViewSettings, wkeWebView webView, const wkeViewSettings* settings, "") \
    ITERATOR3(void, wkeSetDebugConfig, wkeWebView webView, const char* debugString, const char* param, "") \
    \
    ITERATOR0(void, wkeFinalize, "") \
    ITERATOR0(void, wkeUpdate, "") \
    ITERATOR0(unsigned int, wkeGetVersion, "") \
    ITERATOR0(const utf8*, wkeGetVersionString, "") \
    \
    ITERATOR0(wkeWebView, wkeCreateWebView, "") \
    ITERATOR1(void, wkeDestroyWebView, wkeWebView webView, "") \
    \
    ITERATOR2(void, wkeSetMemoryCacheEnable, wkeWebView webView, bool b, "") \
    ITERATOR2(void, wkeSetTouchEnabled, wkeWebView webView, bool b, "") \
    ITERATOR2(void, wkeSetNavigationToNewWindowEnable, wkeWebView webView, bool b, "") \
    ITERATOR2(void, wkeSetCspCheckEnable, wkeWebView webView, bool b, "") \
    ITERATOR2(void, wkeSetNpapiPluginsEnabled, wkeWebView webView, bool b, "") \
    ITERATOR2(void, wkeSetHeadlessEnabled, wkeWebView webView, bool b, "可以关闭渲染") \
    ITERATOR2(void, wkeSetDragEnable, wkeWebView webView, bool b, "可关闭拖拽文件加载网页") \
    \
    ITERATOR2(void, wkeSetViewNetInterface, wkeWebView webView, const char* netInterface, "") \
    \
    ITERATOR1(void, wkeSetProxy, const wkeProxy* proxy, "") \
    ITERATOR2(void, wkeSetViewProxy, wkeWebView webView, wkeProxy *proxy, "") \
    \
    ITERATOR1(const char*, wkeGetName, wkeWebView webView, "") \
    ITERATOR2(void, wkeSetName, wkeWebView webView, const char* name, "") \
    \
    ITERATOR2(void, wkeSetHandle, wkeWebView webView, HWND wnd, "") \
    ITERATOR3(void, wkeSetHandleOffset, wkeWebView webView, int x, int y, "") \
    \
    ITERATOR1(bool, wkeIsTransparent, wkeWebView webView, "") \
    ITERATOR2(void, wkeSetTransparent, wkeWebView webView, bool transparent, "") \
    \
    ITERATOR2(void, wkeSetUserAgent, wkeWebView webView, const utf8* userAgent, "") \
    ITERATOR2(void, wkeSetUserAgentW, wkeWebView webView, const wchar_t* userAgent, "") \
    \
    ITERATOR2(void, wkeLoadW, wkeWebView webView, const wchar_t* url, "") \
    ITERATOR2(void, wkeLoadURL, wkeWebView webView, const utf8* url, "") \
    ITERATOR2(void, wkeLoadURLW, wkeWebView webView, const wchar_t* url, "") \
    ITERATOR4(void, wkePostURL, wkeWebView wkeView, const utf8* url, const char* postData, int postLen, "") \
    ITERATOR4(void, wkePostURLW, wkeWebView wkeView, const wchar_t* url, const char* postData, int postLen, "") \
    \
    ITERATOR2(void, wkeLoadHTML, wkeWebView webView, const utf8* html, "") \
    ITERATOR2(void, wkeLoadHTMLW, wkeWebView webView, const wchar_t* html, "") \
    \
    ITERATOR2(void, wkeLoadFile, wkeWebView webView, const utf8* filename, "") \
    ITERATOR2(void, wkeLoadFileW, wkeWebView webView, const wchar_t* filename, "") \
    \
    ITERATOR1(const utf8*, wkeGetURL, wkeWebView webView, "") \
    \
    ITERATOR1(bool, wkeIsLoading, wkeWebView webView, "") \
    ITERATOR1(bool, wkeIsLoadingSucceeded, wkeWebView webView, "") \
    ITERATOR1(bool, wkeIsLoadingFailed, wkeWebView webView, "") \
    ITERATOR1(bool, wkeIsLoadingCompleted, wkeWebView webView, "") \
    ITERATOR1(bool, wkeIsDocumentReady, wkeWebView webView, "") \
    ITERATOR1(void, wkeStopLoading, wkeWebView webView, "") \
    ITERATOR1(void, wkeReload, wkeWebView webView, "") \
    \
    ITERATOR1(const utf8*, wkeGetTitle, wkeWebView webView, "") \
    ITERATOR1(const wchar_t*, wkeGetTitleW, wkeWebView webView, "") \
    \
    ITERATOR3(void, wkeResize, wkeWebView webView, int w, int h, "") \
    ITERATOR1(int, wkeGetWidth, wkeWebView webView, "") \
    ITERATOR1(int, wkeGetHeight, wkeWebView webView, "") \
    ITERATOR1(int, wkeGetContentWidth, wkeWebView webView, "") \
    ITERATOR1(int, wkeGetContentHeight, wkeWebView webView, "") \
    \
    ITERATOR2(void, wkeSetDirty, wkeWebView webView, bool dirty, "") \
    ITERATOR1(bool, wkeIsDirty, wkeWebView webView, "") \
    ITERATOR5(void, wkeAddDirtyArea, wkeWebView webView, int x, int y, int w, int h, "") \
    ITERATOR1(void, wkeLayoutIfNeeded, wkeWebView webView, "") \
    ITERATOR11(void, wkePaint2, wkeWebView webView, void* bits, int bufWid, int bufHei, int xDst, int yDst, int w, int h, int xSrc, int ySrc, bool bCopyAlpha, "") \
    ITERATOR3(void, wkePaint, wkeWebView webView, void* bits, int pitch, "") \
    ITERATOR1(void, wkeRepaintIfNeeded, wkeWebView webView, "") \
    ITERATOR1(HDC, wkeGetViewDC, wkeWebView webView, "") \
    ITERATOR1(HWND, wkeGetHostHWND, wkeWebView webView, "") \
    \
    ITERATOR1(bool, wkeCanGoBack, wkeWebView webView, "") \
    ITERATOR1(bool, wkeGoBack, wkeWebView webView, "") \
    ITERATOR1(bool, wkeCanGoForward, wkeWebView webView, "") \
    ITERATOR1(bool, wkeGoForward, wkeWebView webView, "") \
    \
    ITERATOR1(void, wkeEditorSelectAll, wkeWebView webView, "") \
    ITERATOR1(void, wkeEditorUnSelect, wkeWebView webView, "") \
    ITERATOR1(void, wkeEditorCopy, wkeWebView webView, "") \
    ITERATOR1(void, wkeEditorCut, wkeWebView webView, "") \
    ITERATOR1(void, wkeEditorPaste, wkeWebView webView, "") \
    ITERATOR1(void, wkeEditorDelete, wkeWebView webView, "") \
    ITERATOR1(void, wkeEditorUndo, wkeWebView webView, "") \
    ITERATOR1(void, wkeEditorRedo, wkeWebView webView, "") \
    \
    ITERATOR1(const wchar_t*, wkeGetCookieW, wkeWebView webView, "") \
    ITERATOR1(const utf8*, wkeGetCookie, wkeWebView webView, "") \
    ITERATOR3(void, wkeSetCookie, wkeWebView webView, const utf8* url, const utf8* cookie, "cookie格式必须是:Set-cookie: PRODUCTINFO=webxpress; domain=.fidelity.com; path=/; secure") \
    ITERATOR2(void, wkeVisitAllCookie, void* params, wkeCookieVisitor visitor, "") \
    ITERATOR1(void, wkePerformCookieCommand, wkeCookieCommand command, "") \
    ITERATOR2(void, wkeSetCookieEnabled, wkeWebView webView, bool enable, "") \
    ITERATOR1(bool, wkeIsCookieEnabled, wkeWebView webView, "") \
    ITERATOR2(void, wkeSetCookieJarPath, wkeWebView webView, const WCHAR* path, "") \
    ITERATOR2(void, wkeSetCookieJarFullPath, wkeWebView webView, const WCHAR* path, "") \
    ITERATOR2(void, wkeSetLocalStorageFullPath, wkeWebView webView, const WCHAR* path, "") \
    \
    ITERATOR2(void, wkeSetMediaVolume, wkeWebView webView, float volume, "") \
    ITERATOR1(float, wkeGetMediaVolume, wkeWebView webView, "") \
    \
    ITERATOR5(bool, wkeFireMouseEvent, wkeWebView webView, unsigned int message, int x, int y, unsigned int flags, "") \
    ITERATOR4(bool, wkeFireContextMenuEvent, wkeWebView webView, int x, int y, unsigned int flags, "") \
    ITERATOR5(bool, wkeFireMouseWheelEvent, wkeWebView webView, int x, int y, int delta, unsigned int flags, "") \
    ITERATOR4(bool, wkeFireKeyUpEvent, wkeWebView webView, unsigned int virtualKeyCode, unsigned int flags, bool systemKey, "") \
    ITERATOR4(bool, wkeFireKeyDownEvent, wkeWebView webView, unsigned int virtualKeyCode, unsigned int flags, bool systemKey, "") \
    ITERATOR4(bool, wkeFireKeyPressEvent, wkeWebView webView, unsigned int charCode, unsigned int flags, bool systemKey, "") \
    ITERATOR6(bool, wkeFireWindowsMessage, wkeWebView webView, HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam, LRESULT* result, "") \
    \
    ITERATOR1(void, wkeSetFocus, wkeWebView webView, "") \
    ITERATOR1(void, wkeKillFocus, wkeWebView webView, "") \
    \
    ITERATOR1(wkeRect, wkeGetCaretRect, wkeWebView webView, "") \
    \
    ITERATOR2(jsValue, wkeRunJS, wkeWebView webView, const utf8* script, "") \
    ITERATOR2(jsValue, wkeRunJSW, wkeWebView webView, const wchar_t* script, "") \
    \
    ITERATOR1(jsExecState, wkeGlobalExec, wkeWebView webView, "") \
    \
    ITERATOR1(void, wkeSleep, wkeWebView webView, "") \
    ITERATOR1(void, wkeWake, wkeWebView webView, "") \
    ITERATOR1(bool, wkeIsAwake, wkeWebView webView, "") \
    \
    ITERATOR2(void, wkeSetZoomFactor, wkeWebView webView, float factor, "") \
    ITERATOR1(float, wkeGetZoomFactor, wkeWebView webView, "") \
    \
    ITERATOR2(void, wkeSetEditable, wkeWebView webView, bool editable, "") \
    \
    ITERATOR1(const utf8*, wkeGetString, const wkeString string, "") \
    ITERATOR1(const wchar_t*, wkeGetStringW, const wkeString string, "") \
    \
    ITERATOR3(void, wkeSetString, wkeString string, const utf8* str, size_t len, "") \
    ITERATOR3(void, wkeSetStringW, wkeString string, const wchar_t* str, size_t len, "") \
    \
    ITERATOR2(wkeString, wkeCreateStringW, const wchar_t* str, size_t len, "") \
    ITERATOR1(void, wkeDeleteString, wkeString str, "") \
    \
    ITERATOR0(wkeWebView, wkeGetWebViewForCurrentContext, "") \
    ITERATOR3(void, wkeSetUserKeyValue, wkeWebView webView, const char* key, void* value, "") \
    ITERATOR2(void*, wkeGetUserKeyValue, wkeWebView webView, const char* key, "") \
    \
    ITERATOR1(int, wkeGetCursorInfoType, wkeWebView webView, "") \
    ITERATOR5(void, wkeSetDragFiles, wkeWebView webView, const POINT* clintPos, const POINT* screenPos, wkeString files[], int filesCount, "") \
    \
    ITERATOR5(void, wkeSetDeviceParameter, wkeWebView webView, const char* device, const char* paramStr, int paramInt, float paramFloat, "") \
    ITERATOR1(wkeTempCallbackInfo*, wkeGetTempCallbackInfo, wkeWebView webView, "") \
    \
    ITERATOR3(void, wkeOnMouseOverUrlChanged, wkeWebView webView, wkeTitleChangedCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnTitleChanged, wkeWebView webView, wkeTitleChangedCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnURLChanged, wkeWebView webView, wkeURLChangedCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnURLChanged2, wkeWebView webView, wkeURLChangedCallback2 callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnPaintUpdated, wkeWebView webView, wkePaintUpdatedCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnAlertBox, wkeWebView webView, wkeAlertBoxCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnConfirmBox, wkeWebView webView, wkeConfirmBoxCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnPromptBox, wkeWebView webView, wkePromptBoxCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnNavigation, wkeWebView webView, wkeNavigationCallback callback, void* param, "") \
    ITERATOR3(void, wkeOnCreateView, wkeWebView webView, wkeCreateViewCallback callback, void* param, "") \
    ITERATOR3(void, wkeOnDocumentReady, wkeWebView webView, wkeDocumentReadyCallback callback, void* param, "") \
    ITERATOR3(void, wkeOnDocumentReady2, wkeWebView webView, wkeDocumentReady2Callback callback, void* param, "") \
    ITERATOR3(void, wkeOnLoadingFinish, wkeWebView webView, wkeLoadingFinishCallback callback, void* param, "") \
    ITERATOR3(void, wkeOnDownload, wkeWebView webView, wkeDownloadCallback callback, void* param, "") \
    ITERATOR3(void, wkeOnConsole, wkeWebView webView, wkeConsoleCallback callback, void* param, "") \
    ITERATOR3(void, wkeSetUIThreadCallback, wkeWebView webView, wkeCallUiThread callback, void* param, "") \
    ITERATOR3(void, wkeOnLoadUrlBegin, wkeWebView webView, wkeLoadUrlBeginCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnLoadUrlEnd, wkeWebView webView, wkeLoadUrlEndCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnDidCreateScriptContext, wkeWebView webView, wkeDidCreateScriptContextCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnWillReleaseScriptContext, wkeWebView webView, wkeWillReleaseScriptContextCallback callback, void* callbackParam, "") \
    ITERATOR3(void, wkeOnWindowClosing, wkeWebView webWindow, wkeWindowClosingCallback callback, void* param, "") \
    ITERATOR3(void, wkeOnWindowDestroy, wkeWebView webWindow, wkeWindowDestroyCallback callback, void* param, "") \
    ITERATOR3(void, wkeOnDraggableRegionsChanged, wkeWebView webWindow, wkeDraggableRegionsChangedCallback callback, void* param, "") \
    ITERATOR3(void, wkeOnWillMediaLoad, wkeWebView webWindow, wkeWillMediaLoadCallback callback, void* param, "") \
    \
    ITERATOR3(void, wkeOnOtherLoad, wkeWebView webWindow, wkeOnOtherLoadCallback callback, void* param, "") \
    ITERATOR2(void, wkeDeleteWillSendRequestInfo, wkeWebView webWindow, wkeWillSendRequestInfo* info, "") \
    \
    ITERATOR2(void, wkeNetSetMIMEType, void* job, char *type, "") \
    ITERATOR4(void, wkeNetSetHTTPHeaderField, void* job, wchar_t* key, wchar_t* value, bool response, "") \
    ITERATOR2(void, wkeNetSetURL, void* job, const char *url, "") \
    ITERATOR3(void, wkeNetSetData, void* job, void *buf, int len, "调用此函数后,网络层收到数据会存储在一buf内,接收数据完成后响应OnLoadUrlEnd事件.#此调用严重影响性能,慎用" \
        "此函数和wkeNetSetData的区别是，wkeNetHookRequest会在接受到真正网络数据后再调用回调，并允许回调修改网络数据。"\
        "而wkeNetSetData是在网络数据还没发送的时候修改") \
    ITERATOR1(void, wkeNetHookRequest, void *job, "") \
    ITERATOR3(void, wkeNetOnResponse, wkeWebView webView, wkeNetResponseCallback callback, void* param, "") \
    ITERATOR2(void, wkeNetGetMIMEType, void* job, wkeString mime, "") \
    \
    ITERATOR2(bool, wkeIsMainFrame, wkeWebView webView, wkeWebFrameHandle frameId, "") \
    ITERATOR2(bool, wkeIsWebRemoteFrame, wkeWebView webView, wkeWebFrameHandle frameId, "") \
    ITERATOR1(wkeWebFrameHandle, wkeWebFrameGetMainFrame, wkeWebView webView, "") \
    ITERATOR4(jsValue, wkeRunJsByFrame, wkeWebView webView, wkeWebFrameHandle frameId, const utf8* script, bool isInClosure, "") \
    \
    ITERATOR3(void, wkeWebFrameGetMainWorldScriptContext, wkeWebView webView, wkeWebFrameHandle webFrameId, v8ContextPtr contextOut, "") \
    \
    ITERATOR0(v8Isolate, wkeGetBlinkMainThreadIsolate, "") \
    \
    ITERATOR6(wkeWebView, wkeCreateWebWindow, wkeWindowType type, HWND parent, int x, int y, int width, int height, "") \
    ITERATOR1(void, wkeDestroyWebWindow, wkeWebView webWindow, "") \
    ITERATOR1(HWND, wkeGetWindowHandle, wkeWebView webWindow, "") \
    \
    ITERATOR2(void, wkeShowWindow, wkeWebView webWindow, bool show, "") \
    ITERATOR2(void, wkeEnableWindow, wkeWebView webWindow, bool enable, "") \
    \
    ITERATOR5(void, wkeMoveWindow, wkeWebView webWindow, int x, int y, int width, int height, "") \
    ITERATOR1(void, wkeMoveToCenter, wkeWebView webWindow, "") \
    ITERATOR3(void, wkeResizeWindow, wkeWebView webWindow, int width, int height, "") \
    \
    ITERATOR6(wkeWebDragOperation, wkeDragTargetDragEnter, wkeWebView webWindow, const wkeWebDragData* webDragData, const POINT* clientPoint, const POINT* screenPoint, wkeWebDragOperationsMask operationsAllowed, int modifiers, "") \
    ITERATOR5(wkeWebDragOperation, wkeDragTargetDragOver, wkeWebView webWindow, const POINT* clientPoint, const POINT* screenPoint, wkeWebDragOperationsMask operationsAllowed, int modifiers, "") \
    ITERATOR1(void, wkeDragTargetDragLeave, wkeWebView webWindow, ""); \
    ITERATOR4(void, wkeDragTargetDrop, wkeWebView webWindow, const POINT* clientPoint, const POINT* screenPoint, int modifiers, "") \
    \
    ITERATOR2(void, wkeSetWindowTitle, wkeWebView webWindow, const utf8* title, "") \
    ITERATOR2(void, wkeSetWindowTitleW, wkeWebView webWindow, const wchar_t* title, "") \
    \
    ITERATOR3(void, jsBindFunction, const char* name, jsNativeFunction fn, unsigned int argCount, "") \
    ITERATOR2(void, jsBindGetter, const char* name, jsNativeFunction fn, "") \
    ITERATOR2(void, jsBindSetter, const char* name, jsNativeFunction fn, "") \
    \
    ITERATOR4(void, wkeJsBindFunction, const char* name, wkeJsNativeFunction fn, void* param, unsigned int argCount, "") \
    ITERATOR3(void, wkeJsBindGetter, const char* name, wkeJsNativeFunction fn, void* param, "") \
    ITERATOR3(void, wkeJsBindSetter, const char* name, wkeJsNativeFunction fn, void* param, "") \
    \
    ITERATOR1(int, jsArgCount, jsExecState es, "") \
    ITERATOR2(jsType, jsArgType, jsExecState es, int argIdx, "") \
    ITERATOR2(jsValue, jsArg, jsExecState es, int argIdx, "") \
    \
    ITERATOR1(jsType, jsTypeOf, jsValue v, "") \
    ITERATOR1(bool, jsIsNumber, jsValue v, "") \
    ITERATOR1(bool, jsIsString, jsValue v, "") \
    ITERATOR1(bool, jsIsBoolean, jsValue v, "") \
    ITERATOR1(bool, jsIsObject, jsValue v, "") \
    ITERATOR1(bool, jsIsFunction, jsValue v, "") \
    ITERATOR1(bool, jsIsUndefined, jsValue v, "") \
    ITERATOR1(bool, jsIsNull, jsValue v, "") \
    ITERATOR1(bool, jsIsArray, jsValue v, "") \
    ITERATOR1(bool, jsIsTrue, jsValue v, "") \
    ITERATOR1(bool, jsIsFalse, jsValue v, "") \
    \
    ITERATOR2(int, jsToInt, jsExecState es, jsValue v, "") \
    ITERATOR2(float, jsToFloat, jsExecState es, jsValue v, "") \
    ITERATOR2(double, jsToDouble, jsExecState es, jsValue v, "") \
    ITERATOR2(bool, jsToBoolean, jsExecState es, jsValue v, "") \
    ITERATOR3(jsValue, jsArrayBuffer, jsExecState es, char * buffer, size_t size, "") \
    ITERATOR2(const utf8*, jsToTempString, jsExecState es, jsValue v, "") \
    ITERATOR2(const wchar_t*, jsToTempStringW, jsExecState es, jsValue v, "") \
    \
    ITERATOR1(jsValue, jsInt, int n, "") \
    ITERATOR1(jsValue, jsFloat, float f, "") \
    ITERATOR1(jsValue, jsDouble, double d, "") \
    ITERATOR1(jsValue, jsBoolean, bool b, "") \
    \
    ITERATOR0(jsValue, jsUndefined, "") \
    ITERATOR0(jsValue, jsNull, "") \
    ITERATOR0(jsValue, jsTrue, "") \
    ITERATOR0(jsValue, jsFalse, "") \
    \
    ITERATOR2(jsValue, jsString, jsExecState es, const utf8* str, "") \
    ITERATOR2(jsValue, jsStringW, jsExecState es, const wchar_t* str, "") \
    ITERATOR1(jsValue, jsEmptyObject, jsExecState es, "") \
    ITERATOR1(jsValue, jsEmptyArray, jsExecState es, "") \
    \
    ITERATOR2(jsValue, jsObject, jsExecState es, jsData* obj, "") \
    ITERATOR2(jsValue, jsFunction, jsExecState es, jsData* obj, "") \
    ITERATOR2(jsData*, jsGetData, jsExecState es, jsValue object, "") \
    \
    ITERATOR3(jsValue, jsGet, jsExecState es, jsValue object, const char* prop, "") \
    ITERATOR4(void, jsSet, jsExecState es, jsValue object, const char* prop, jsValue v, "") \
    \
    ITERATOR3(jsValue, jsGetAt, jsExecState es, jsValue object, int index, "") \
    ITERATOR4(void, jsSetAt, jsExecState es, jsValue object, int index, jsValue v, "") \
    \
    ITERATOR2(int, jsGetLength, jsExecState es, jsValue object, "") \
    ITERATOR3(void, jsSetLength, jsExecState es, jsValue object, int length, "") \
    \
    ITERATOR1(jsValue, jsGlobalObject, jsExecState es, "") \
    ITERATOR1(wkeWebView, jsGetWebView, jsExecState es, "") \
    \
    ITERATOR2(jsValue, jsEval, jsExecState es, const utf8* str, "") \
    ITERATOR2(jsValue, jsEvalW, jsExecState es, const wchar_t* str, "") \
    ITERATOR3(jsValue, jsEvalExW, jsExecState es, const wchar_t* str, bool isInClosure, "") \
    \
    ITERATOR5(jsValue, jsCall, jsExecState es, jsValue func, jsValue thisObject, jsValue* args, int argCount, "") \
    ITERATOR4(jsValue, jsCallGlobal, jsExecState es, jsValue func, jsValue* args, int argCount, "") \
    \
    ITERATOR2(jsValue, jsGetGlobal, jsExecState es, const char* prop, "") \
    ITERATOR3(void, jsSetGlobal, jsExecState es, const char* prop, jsValue v, "") \
    \
    ITERATOR0(void, jsGC, "")

#if ENABLE_WKE == 1

extern "C" __declspec(dllexport) void wkeInit();
extern "C" __declspec(dllexport) void wkeInitialize();
extern "C" __declspec(dllexport) void wkeInitializeEx(const wkeSettings* settings);
extern "C" __declspec(dllexport) void wkeFinalize();

WKE_FOR_EACH_DEFINE_FUNCTION(WKE_DECLARE_ITERATOR0, WKE_DECLARE_ITERATOR1, WKE_DECLARE_ITERATOR2, \
    WKE_DECLARE_ITERATOR3, WKE_DECLARE_ITERATOR4, WKE_DECLARE_ITERATOR5, WKE_DECLARE_ITERATOR6, WKE_DECLARE_ITERATOR11)

#else

WKE_FOR_EACH_DEFINE_FUNCTION(WKE_DEFINE_ITERATOR0, WKE_DEFINE_ITERATOR1, WKE_DEFINE_ITERATOR2, \
    WKE_DEFINE_ITERATOR3, WKE_DEFINE_ITERATOR4, WKE_DEFINE_ITERATOR5, WKE_DEFINE_ITERATOR6, WKE_DEFINE_ITERATOR11)

typedef void (WKE_CALL_TYPE *FN_wkeInitializeEx)(const wkeSettings* settings);

__declspec(selectany) const wchar_t* kWkeDllPath = L"node.dll";

inline void wkeSetWkeDllPath(const wchar_t* dllPath)
{
    kWkeDllPath = dllPath;
}

inline void wkeInitializeEx(const wkeSettings* settings)
{
#if defined(__cplusplus)
    HMODULE hMod = ::LoadLibraryW(kWkeDllPath);

    FN_wkeInitializeEx wkeInitializeExFunc = (FN_wkeInitializeEx)::GetProcAddress(hMod, "wkeInitializeEx");
    wkeInitializeExFunc(settings);
#else
    HMODULE hMod = LoadLibraryW(kWkeDllPath);

    FN_wkeInitializeEx wkeInitializeExFunc = (FN_wkeInitializeEx)GetProcAddress(hMod, "wkeInitializeEx");
    wkeInitializeExFunc(settings);
#endif

    WKE_FOR_EACH_DEFINE_FUNCTION(WKE_GET_PTR_ITERATOR0, WKE_GET_PTR_ITERATOR1, WKE_GET_PTR_ITERATOR2, WKE_GET_PTR_ITERATOR3, \
        WKE_GET_PTR_ITERATOR4, WKE_GET_PTR_ITERATOR5, WKE_GET_PTR_ITERATOR6, WKE_GET_PTR_ITERATOR11);

    return;
}

inline void wkeInit()
{
    wkeInitializeEx(((const wkeSettings*)0));
    return;
}

inline void wkeInitialize()
{
    wkeInitializeEx(((const wkeSettings*)0));
    return;
}

#endif



#endif // WKE_DEFINE_H

