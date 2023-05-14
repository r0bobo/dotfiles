// Force-enable webrender
user_pref("gfx.webrender.all", true);

// Hardware acceleration for video
user_pref("media.ffmpeg.vaapi-drm-display.enabled", true);
user_pref("media.ffmpeg.vaapi.enabled", true);

// Smooth scrolling
// https://www.reddit.com/r/firefox/comments/7ei43x/any_way_to_make_the_smooth_scrolling_act_the_same/dq5afi0/
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 250);
user_pref("general.smoothScroll.msdPhysics.enabled", true);
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 450);
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 450);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 50);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio", 0.4);
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 5000);
user_pref("toolkit.scrollbox.verticalScrollDistance", 5);
user_pref("toolkit.scrollbox.horizontalScrollDistance", 4);

// Scroll sensitivty
user_pref("mousewheel.min_line_scroll_amount", 75);

// Disable webrtc popup
// https://stackoverflow.com/questions/30852775/how-to-hide-firefox-camera-icon-overlay-in-windows
user_pref("privacy.webrtc.legacyGlobalIndicator", false);

// Enable calculator
user_pref("browser.urlbar.suggest.calculator", true);

// Atuo-hude cookie banners
// https://github.com/r0bobo/kubedoc.el/actions/actions/workflows/test.yaml/badge.svg
// 1: rejects all cookies if possible, otherwise does nothing
// 2: rejects all cookies if possible, otherwise does what you would probably do to quickly get rid of the cookie banner, which is to accept all of them
user_pref("cookiebanners.service.mode", 1);
user_pref("cookiebanners.service.mode.privateBrowsing", 1);
