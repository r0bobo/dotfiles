# Powerlevel9k Settings

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Colors
## Colors from vim-quantum
prompt_colors_gray1=236  # '#263238'
prompt_colors_gray2=238  # '#2c3e44'
prompt_colors_gray3=240  # '#415a63'
prompt_colors_gray4=244  # '#608592'
prompt_colors_gray5=250  # '#aabbc3'
prompt_colors_red=204    # '#dd6880'
prompt_colors_green=114  # '#83b879'
prompt_colors_yellow=221 # '#ddb76f'
prompt_colors_blue=75    # '#7aa5e6'
prompt_colors_purple=141 # '#ad88e2'
prompt_colors_cyan=44    # '#63c9d6'
prompt_colors_orange=209 # '#da8c68'
prompt_colors_navy=61    # '#6272cb'

## context
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=$prompt_colors_gray5
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=$prompt_colors_gray1

## dir
POWERLEVEL9K_DIR_HOME_BACKGROUND=$prompt_colors_blue
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$prompt_colors_blue
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$prompt_colors_orange
POWERLEVEL9K_DIR_HOME_FOREGROUND=$prompt_colors_gray1
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$prompt_colors_gray1
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=$prompt_colors_gray1

## status
POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$prompt_colors_red
POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$prompt_colors_gray1

## vcs
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$prompt_colors_gray3
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$prompt_colors_gray3
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$prompt_colors_gray3
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$prompt_colors_gray5
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$prompt_colors_yellow
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$prompt_colors_yellow
