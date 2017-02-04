# Powerlevel9k Settings

## prompt segments
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context background_jobs dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

## dir settings 
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

## status settings
POWERLEVEL9K_STATUS_VERBOSE=true

## gruvbox colors
prompt_dark_aqua=72
prompt_light_aqua=108
prompt_dark_blue=66
prompt_light_blue=109
prompt_dark_green=106
prompt_light_green=142
prompt_dark_orange=166
prompt_light_orange=208
prompt_dark_purple=175
prompt_light_purple=132
prompt_dark_red=174
prompt_light_red=167
prompt_dark_yellow=172
prompt_light_yellow=214

prompt_white_fg=223
prompt_white_fg0=229
prompt_white_fg1=223
prompt_white_fg2=250
prompt_gray=245
prompt_gray_bg3=241
prompt_gray_bg4=243
prompt_black_bg=235
prompt_black_bg1=237
prompt_black_bg2=239

## context
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=$prompt_white_fg1
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=$prompt_black_bg

## dir
POWERLEVEL9K_DIR_HOME_BACKGROUND=$prompt_dark_aqua
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$prompt_dark_aqua
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$prompt_dark_yellow
POWERLEVEL9K_DIR_HOME_FOREGROUND=$prompt_black_bg
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$prompt_black_bg
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=$prompt_black_bg

## status
POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$prompt_light_red
POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$prompt_black_bg

## time
POWERLEVEL9K_TIME_BACKGROUND=$prompt_white_fg1
POWERLEVEL9K_TIME_FOREGROUND=$prompt_black_bg

## vcs
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$prompt_black_bg2
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$prompt_black_bgs2
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$prompt_black_bg2
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$prompt_gray
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$prompt_light_yellow
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$prompt_light_yellow

## virtualenv
POWERLEVEL9K_VIRTUALENV_BACKGROUND=$prompt_light_yellow
POWERLEVEL9K_VIRTUALENV_FOREGROUND=$prompt_black_bg
