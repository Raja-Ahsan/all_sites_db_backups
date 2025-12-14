1:"$Sreact.fragment"
8:I[3536,[],""]
:HL["/_next/static/css/eebecc125ac7b0d3.css","style"]
2:T11ed,
              (function() {
                try {
                  var apiUrl = 'http://localhost:5000';
                  
                  if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
                    apiUrl = 'http://localhost:5000';
                  } else if (window.location.hostname === 'emeraldsrxhr.sitestaginglink.com') {
                    apiUrl = window.location.origin;
                  } else {
                    apiUrl = window.location.origin;
                  }
                  
                  // Apply dark mode early
                  try {
                    var ls = null;
                    try { ls = localStorage.getItem('dark_mode'); } catch (_) {}
                    var themePref = null;
                    try { themePref = localStorage.getItem('theme'); } catch (_) {}
                    var prefersDark = false;
                    try { prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches; } catch (_) {}
                    var isDark = (ls === 'true') ? true
                              : (ls === 'false') ? false
                              : (themePref === 'dark') ? true
                              : (themePref === 'light') ? false
                              : prefersDark;
                    if (isDark) {
                      document.documentElement.classList.add('dark');
                    } else {
                      document.documentElement.classList.remove('dark');
                    }
                  } catch (e) {}
                  
                  // Fetch theme synchronously
                  try {
                    var themeXhr = new XMLHttpRequest();
                    themeXhr.open('GET', apiUrl + '/api/settings/sidebar_theme', false);
                    themeXhr.send();
                    
                    if (themeXhr.status === 200) {
                      var themeData = JSON.parse(themeXhr.responseText);
                      if (themeData.success && themeData.data) {
                        window.__SIDEBAR_THEME__ = themeData.data;
                        window.__SIDEBAR_THEME_LOADED__ = true;
                      }
                    }
                  } catch (e) {
                    window.__SIDEBAR_THEME_LOADED__ = false;
                  }
                  
                  // Fetch dark mode setting
                  try {
                    var darkXhr = new XMLHttpRequest();
                    darkXhr.open('GET', apiUrl + '/api/settings/dark_mode', false);
                    darkXhr.send();
                    if (darkXhr.status === 200) {
                      var darkData = JSON.parse(darkXhr.responseText);
                      if (darkData && darkData.success) {
                        var darkVal = darkData.data;
                        if (typeof darkVal === 'boolean') {
                          if (darkVal) {
                            document.documentElement.classList.add('dark');
                            try { localStorage.setItem('dark_mode', 'true'); localStorage.setItem('theme', 'dark'); } catch (_) {}
                          } else {
                            document.documentElement.classList.remove('dark');
                            try { localStorage.setItem('dark_mode', 'false'); localStorage.setItem('theme', 'light'); } catch (_) {}
                          }
                        }
                      }
                    }
                  } catch (e) {}
                  
                  // Fetch logo synchronously
                  try {
                    var logoXhr = new XMLHttpRequest();
                    logoXhr.open('GET', apiUrl + '/api/settings/sidebar_logo', false);
                    logoXhr.send();
                    
                    if (logoXhr.status === 200) {
                      var logoData = JSON.parse(logoXhr.responseText);
                      if (logoData.success) {
                        window.__SIDEBAR_LOGO__ = logoData.data;
                        window.__SIDEBAR_LOGO_LOADED__ = true;
                      }
                    }
                  } catch (e) {
                    window.__SIDEBAR_LOGO_LOADED__ = false;
                  }
                } catch (e) {
                  window.__SIDEBAR_THEME__ = null;
                  window.__SIDEBAR_LOGO__ = null;
                  window.__SIDEBAR_THEME_LOADED__ = false;
                  window.__SIDEBAR_LOGO_LOADED__ = false;
                }
              })();
            0:{"P":null,"b":"qZ05_rYv9f2ws1NRVMaWj","p":"","c":["","user-management"],"i":false,"f":[[["",{"children":["(main)",{"children":["user-management",{"children":["__PAGE__",{}]}]}]},"$undefined","$undefined",true],["",["$","$1","c",{"children":[[["$","link","0",{"rel":"stylesheet","href":"/_next/static/css/eebecc125ac7b0d3.css","precedence":"next","crossOrigin":"$undefined","nonce":"$undefined"}]],["$","html",null,{"lang":"en","suppressHydrationWarning":true,"children":[["$","head",null,{"children":["$","script",null,{"dangerouslySetInnerHTML":{"__html":"$2"}}]}],"$L3"]}]]}],{"children":["(main)","$L4",{"children":["user-management","$L5",{"children":["__PAGE__","$L6",{},null,false]},null,false]},null,false]},null,false],"$L7",false]],"m":"$undefined","G":["$8",[]],"s":false,"S":true}
9:I[9560,["177","static/chunks/app/layout-222af7a100cffc56.js"],"Providers"]
a:I[5204,[],""]
b:I[2642,[],""]
c:I[578,["345","static/chunks/app/not-found-57de7c57f04a8b76.js"],""]
d:I[1986,["76","static/chunks/app/(main)/layout-da465e4bae193050.js"],"ProtectedRoute"]
e:I[1088,["76","static/chunks/app/(main)/layout-da465e4bae193050.js"],"Navigation"]
f:I[6402,["76","static/chunks/app/(main)/layout-da465e4bae193050.js"],"NotificationBell"]
10:I[7089,[],"ClientPageRoot"]
11:I[5200,["885","static/chunks/app/(main)/user-management/page-68595b6f9f9dce09.js"],"default"]
14:I[433,[],"OutletBoundary"]
16:I[9884,[],"AsyncMetadataOutlet"]
18:I[433,[],"ViewportBoundary"]
1a:I[433,[],"MetadataBoundary"]
1b:"$Sreact.suspense"
3:["$","body",null,{"className":"__className_f367f3","children":["$","$L9",null,{"children":["$","$La",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$Lb",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":[["$","div",null,{"className":"min-h-screen flex items-center justify-center bg-gray-50 dark:bg-gray-900","children":["$","div",null,{"className":"text-center","children":[["$","h1",null,{"className":"text-6xl font-bold text-gray-900 dark:text-white mb-4","children":"404"}],["$","h2",null,{"className":"text-2xl font-semibold text-gray-700 dark:text-gray-300 mb-4","children":"Page Not Found"}],["$","p",null,{"className":"text-gray-600 dark:text-gray-400 mb-8","children":"The page you're looking for doesn't exist."}],["$","$Lc",null,{"href":"/","className":"inline-block bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors","children":"Go Back Home"}]]}]}],[]],"forbidden":"$undefined","unauthorized":"$undefined"}]}]}]
4:["$","$1","c",{"children":[null,["$","$Ld",null,{"children":["$","div",null,{"className":"flex min-h-screen","children":[["$","$Le",null,{}],["$","main",null,{"className":"flex-1 ml-64 overflow-auto","children":[["$","div",null,{"className":"sticky top-0 z-10 bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60 border-b","children":["$","div",null,{"className":"flex items-center justify-end p-4","children":["$","$Lf",null,{}]}]}],["$","div",null,{"children":["$","$La",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$Lb",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]}]]}]]}]}]]}]
5:["$","$1","c",{"children":[null,["$","$La",null,{"parallelRouterKey":"children","error":"$undefined","errorStyles":"$undefined","errorScripts":"$undefined","template":["$","$Lb",null,{}],"templateStyles":"$undefined","templateScripts":"$undefined","notFound":"$undefined","forbidden":"$undefined","unauthorized":"$undefined"}]]}]
6:["$","$1","c",{"children":[["$","$L10",null,{"Component":"$11","searchParams":{},"params":{},"promises":["$@12","$@13"]}],null,["$","$L14",null,{"children":["$L15",["$","$L16",null,{"promise":"$@17"}]]}]]}]
7:["$","$1","h",{"children":[null,[["$","$L18",null,{"children":"$L19"}],null],["$","$L1a",null,{"children":["$","div",null,{"hidden":true,"children":["$","$1b",null,{"fallback":null,"children":"$L1c"}]}]}]]}]
12:{}
13:"$6:props:children:0:props:params"
19:[["$","meta","0",{"charSet":"utf-8"}],["$","meta","1",{"name":"viewport","content":"width=device-width, initial-scale=1"}]]
15:null
17:{"metadata":[["$","title","0",{"children":"EmeraldRx HR Management System"}],["$","meta","1",{"name":"description","content":"Comprehensive HR Management System for EmeraldRx Pharmacy"}]],"error":null,"digest":"$undefined"}
1c:"$17:metadata"
