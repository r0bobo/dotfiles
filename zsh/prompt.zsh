# Powerlevel9k Settings

export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv time)
export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
export POWERLEVEL9K_SHORTEN_DELIMITER=""
# export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Colors
## Colors from vim-quantum
export prompt_colors_gray1=236  # '#263238'
export prompt_colors_gray2=238  # '#2c3e44'
export prompt_colors_gray3=240  # '#415a63'
export prompt_colors_gray4=244  # '#608592'
export prompt_colors_gray5=250  # '#aabbc3'
export prompt_colors_red=204    # '#dd6880'
export prompt_colors_green=114  # '#83b879'
export prompt_colors_yellow=221 # '#ddb76f'
export prompt_colors_blue=75    # '#7aa5e6'
export prompt_colors_purple=141 # '#ad88e2'
export prompt_colors_cyan=44    # '#63c9d6'
export prompt_colors_orange=209 # '#da8c68'
export prompt_colors_navy=61    # '#6272cb'

## dir
export POWERLEVEL9K_DIR_HOME_BACKGROUND=$prompt_colors_blue
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=$prompt_colors_blue
export POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=$prompt_colors_gray5
export POWERLEVEL9K_DIR_HOME_FOREGROUND=$prompt_colors_gray1
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=$prompt_colors_gray1
export POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=$prompt_colors_gray1

## status
export POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$prompt_colors_red
export POWERLEVEL9K_STATUS_ERROR_BACKGROUND=$prompt_colors_gray1

## vcs
export POWERLEVEL9K_VCS_CLEAN_BACKGROUND=$prompt_colors_green
export POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=$prompt_colors_yellow
export POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=$prompt_colors_yellow
export POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$prompt_colors_gray1
export POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$prompt_colors_gray1
export POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$prompt_colors_gray1
