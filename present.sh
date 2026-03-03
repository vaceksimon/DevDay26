#!/bin/bash

WORK_BRANCH=devday
MASTER_BRANCH=main

KC_REPO="$HOME/Work/repos/DevDay26"
TESTS_DIR="$KC_REPO/src/test/java/org/keycloak/devday"

confirm_step() {
  read -rsp $'| Press any key to continue...             |\n' -n1 key
}

kc_git() {
  git --git-dir="$KC_REPO/.git" --work-tree="$KC_REPO" "$@"
}

C_SC1_STEP1=c2dc9ef # Scenario 1: config for realm & user
C_SC1_STEP2=20ce964 # Scenario 1: mailserver & oauthclient
C_SC1_STEP3=76d8a65 # Scenario 1: FINISHED: test done

C_SC2_STEP0=a31a819 # Scenario 2: init with adminclient and master realm
C_SC2_STEP1=e4bd2be # Scenario 2: added updateWithCleanup
C_SC2_STEP2=ab72b77 # Scenario 2: FINISHED: test done

C_SC3_STEP0=333b389 # Scenario 3:init with realm & user
C_SC3_STEP1=cedac93 # Scenario 3:server config
C_SC3_STEP2=bb457c2 # Scenario 3 FINISHED: test done

C_SC4_STEP0=35dbc9d # Scenario 4:init with realm & user
C_SC4_STEP1=904daaa # Scenario 4:user config
C_SC4_STEP2=fb3b221 # Scenario 4:rest of managed resources
C_SC4_STEP3=63a46f2 # Scenario 4:set up required consent for test-app
C_SC4_STEP4=4499684 # Scenario 4:cancel consent gives error
C_SC4_STEP5=18591ca # Scenario 4 FINISHED: test done

C_EXT_STEP0=3b753a4 # Extension: provider & test skeleton
C_EXT_STEP1=9b8fe06 # Extension: server config
C_EXT_STEP2=ebf7f6d # Extension FINISHED: test done



echo ""
echo "============================================"
echo "|| Scenario 1                             ||"
echo "|| EmailEventListenerTest                 ||"
echo "============================================"

echo ""
echo "--------------------------------------------"
echo "|  STEP 0                                  |"
echo "|  Init                                    |"
echo "|                                          |"
idea "$TESTS_DIR/scenarios/DevDay1EmailEventListenerTest.java"
confirm_step
echo "-------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 1                                   |"
echo "| Config for Realm and User                |"
echo "|                                          |"
kc_git cherry-pick "$C_SC1_STEP1" --no-commit
idea --line 18 "$TESTS_DIR/scenarios/DevDay1EmailEventListenerTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 2                                   |"
echo "| Mail server and OAuthClient              |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC1_STEP1" > /dev/null
kc_git cherry-pick "$C_SC1_STEP2" --no-commit
idea --line 31 "$TESTS_DIR/scenarios/DevDay1EmailEventListenerTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 3                                   |"
echo "| Test done                                |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC1_STEP2" > /dev/null
kc_git cherry-pick "$C_SC1_STEP3" --no-commit
idea --line 38 "$TESTS_DIR/scenarios/DevDay1EmailEventListenerTest.java"
confirm_step
echo "--------------------------------------------"

echo ""
echo "============================================"
echo "|| Scenario 2                             ||"
echo "|| AdminSignatureAlgorithmTest            ||"
echo "============================================"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC1_STEP3" > /dev/null
kc_git cherry-pick "$C_SC2_STEP0" > /dev/null
idea "$TESTS_DIR/scenarios/DevDay2AdminSignatureAlgorithmTest.java"
confirm_step


echo ""
echo "--------------------------------------------"
echo "| STEP 1                                   |"
echo "| updateWithCleanup                        |"
echo "|                                          |"
kc_git cherry-pick "$C_SC2_STEP1" --no-commit
idea "$TESTS_DIR/scenarios/DevDay2AdminSignatureAlgorithmTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 2                                   |"
echo "| Test done                                |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC2_STEP1" > /dev/null
kc_git cherry-pick "$C_SC2_STEP2" --no-commit
idea "$TESTS_DIR/scenarios/DevDay2AdminSignatureAlgorithmTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "============================================"
echo "|| Scenario 3                             ||"
echo "|| ImpersonationDisabledTest              ||"
echo "============================================"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC2_STEP2" > /dev/null
kc_git cherry-pick "$C_SC3_STEP0" > /dev/null
idea "$TESTS_DIR/scenarios/DevDay3ImpersonationDisabledTest.java"
confirm_step


echo ""
echo "--------------------------------------------"
echo "| STEP 1                                   |"
echo "| Server config                            |"
echo "|                                          |"
kc_git cherry-pick "$C_SC3_STEP1" --no-commit
idea "$TESTS_DIR/scenarios/DevDay3ImpersonationDisabledTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 2                                   |"
echo "| Test done                                |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC3_STEP1" > /dev/null
kc_git cherry-pick "$C_SC3_STEP2" --no-commit
idea "$TESTS_DIR/scenarios/DevDay3ImpersonationDisabledTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "============================================"
echo "|| Scenario 4                             ||"
echo "|| DevDay4ConsentsTest                    ||"
echo "============================================"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC3_STEP2" > /dev/null
kc_git cherry-pick "$C_SC4_STEP0" > /dev/null
idea "$TESTS_DIR/scenarios/DevDay4ConsentsTest.java"
confirm_step


echo ""
echo "--------------------------------------------"
echo "| STEP 1                                   |"
echo "| User config                              |"
echo "|                                          |"
kc_git cherry-pick "$C_SC4_STEP1" --no-commit
idea "$TESTS_DIR/scenarios/DevDay4ConsentsTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 2                                   |"
echo "| Rest of managed resources                |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC4_STEP1" > /dev/null
kc_git cherry-pick "$C_SC4_STEP2" --no-commit
idea "$TESTS_DIR/scenarios/DevDay4ConsentsTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 3                                   |"
echo "| Set up required consent for test-app     |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC4_STEP2" > /dev/null
kc_git cherry-pick "$C_SC4_STEP3" --no-commit
idea "$TESTS_DIR/scenarios/DevDay4ConsentsTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 4                                   |"
echo "| Cancel consent gives error               |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC4_STEP3" > /dev/null
kc_git cherry-pick "$C_SC4_STEP4" --no-commit
idea "$TESTS_DIR/scenarios/DevDay4ConsentsTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 5                                   |"
echo "| FINISHED: test done                      |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC4_STEP4" > /dev/null
kc_git cherry-pick "$C_SC4_STEP5" --no-commit
idea "$TESTS_DIR/scenarios/DevDay4ConsentsTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "============================================"
echo "|| Extension                              ||"
echo "|| Provider                               ||"
echo "============================================"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_SC4_STEP5" > /dev/null
kc_git cherry-pick "$C_EXT_STEP0" > /dev/null


echo ""
echo "--------------------------------------------"
echo "| STEP 1                                   |"
echo "| POM file                                 |"
echo "|                                          |"
idea --line 23 "$KC_REPO/pom.xml"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 2                                   |"
echo "| Provider                                 |"
echo "|                                          |"
idea --line 32 "$KC_REPO/src/main/java/org/keycloak/devday/extension/DevDayRealmResourceProvider.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "============================================"
echo "|| Extension                              ||"
echo "|| ProviderTest                           ||"
echo "============================================"
idea "$TESTS_DIR/extension/DevDayProviderTest.java"
confirm_step


echo ""
echo "--------------------------------------------"
echo "| STEP 1                                   |"
echo "| Server config                            |"
echo "|                                          |"
kc_git cherry-pick "$C_EXT_STEP1" --no-commit
idea "$TESTS_DIR/extension/DevDayProviderTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 2                                   |"
echo "| Rest of managed resources                |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_EXT_STEP1" > /dev/null
kc_git cherry-pick "$C_EXT_STEP2" --no-commit
idea "$TESTS_DIR/extension/DevDayProviderTest.java"
confirm_step
echo "--------------------------------------------"


echo ""
echo "--------------------------------------------"
echo "| STEP 3                                   |"
echo "| DONE                                     |"
echo "|                                          |"
kc_git restore --worktree --staged "$KC_REPO"
kc_git cherry-pick "$C_EXT_STEP2" > /dev/null
idea "$TESTS_DIR/extension/DevDayProviderTest.java"
echo "--------------------------------------------"

