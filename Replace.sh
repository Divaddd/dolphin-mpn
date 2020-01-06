#!/bin/bash
function ReplaceOthers()
{
    /bin/cp -rf "User/Backup/00010000" "User/Wii/title"
    echo Your other Wii saves are correct!
}

function CheckMp9Mp2VC()
{
    #MP9
    echo ===============================================================================
    md5mp9=$(md5sum "User/Wii/title/00010000/53535145/data/save.dat" | cut -d ' ' -f 1)
    if [ $md5mp9 != "7aae01c3f3e2ad8cb55e9f13f36e1851" ]; then
        /bin/cp -rf "User/Backup/title/00010000/53535145" "User/Wii/title/00010000"
        echo Your Mario Party 9 save was incorrect, but is now correct!
    fi

    #MP2 VC
    md5mp2=$(md5sum "User/Wii/title/00010001/4e415a45/data/EEP_NMWE" | cut -d ' ' -f 1)
    if [ $md5mp2 != "9dc1d4204cfa54e90c125226fa781d6d" ]; then
        /bin/cp -rf "User/Backup/title/00010001/4e415a45" "User/Wii/title/00010001"
        echo Your MP2 Virtual Console save was incorrect, but is now correct!
    fi

    echo Do you want to replace your other Wii saves?
    read answer    
    if [ $answer = 'yes' ] || [ $answer = 'y' ]
    then
        ReplaceOthers
    fi
}

function ReplaceMp8()
{
    /bin/cp -rf "User/Backup/title/00010000/524d3845" "User/Wii/title/00010000"
    md5=$(md5sum "User/Wii/title/00010000/524d3845/data/mp8save.bin" | cut -d ' ' -f 1)
    if [ $md5 == "14827382a1c41f9d118a492062ef5600" ]; then
        echo You now have the correct Mario Party 8 file!
        CheckMp9Mp2VC
    else
        echo There was an error replacing the Mario Party 8 file...
    fi
    CheckMp9Mp2VC
}

function CheckMp8()
{
    echo ===============================================================================
    md5=$(md5sum "User/Wii/title/00010000/524d3845/data/mp8save.bin" | cut -d ' ' -f 1)
    if [ $md5 == "14827382a1c41f9d118a492062ef5600" ]; then
        echo Your Mario Party 8 save is correct!
        CheckMp9Mp2VC
    else
        echo 'Your Mario Party 8 save has been changed. Replace?'
        read WII
        if [ $WII = 'yes' ] || [ $WII = 'y' ]
        then
            ReplaceMp8
        else
            CheckMp9Mp2VC
        fi
    fi
}

function CheckRestGC()
{
    echo ===============================================================================
    /bin/cp -rf "User/Backup/others" "User/GC/USA/Card A"
    echo Your other GC saves are correct!
    CheckMp8
}

function ReplaceMp7()
{
    /bin/cp -rf "User/Backup/01-GP7E-MARIPA7.gci" "User/GC/USA/Card A"
    md5=$(md5sum "User/GC/USA/Card A/01-GP7E-MARIPA7.gci" | cut -d ' ' -f 1)
    if [ $md5 == "f40dc6a23022049fc78394ad0c7d93ea" ]; then
        echo You now have the correct Mario Party 7 file!
    else
        echo There was an error replacing the Mario Party 7 file...
    fi
    CheckRestGC
}

function CheckMp7()
{
    echo ===============================================================================
    md5=$(md5sum "User/GC/USA/Card A/01-GP7E-MARIPA7.gci" | cut -d ' ' -f 1)
    if [ $md5 == "f40dc6a23022049fc78394ad0c7d93ea" ]; then
        echo Your Mario Party 7 save is correct!
        CheckRestGC
    else
        echo 'Your Mario Party 7 save has been changed. Replace?'
        read GCSLOTA
        if [ $GCSLOTA = 'yes' ] || [ $GCSLOTA = 'y' ]
        then
            ReplaceMp7
        else
            CheckRestGC
        fi
    fi
}

function ReplaceMp6()
{
    /bin/cp -rf "User/Backup/01-GP6E-MARIPA6.gci" "User/GC/USA/Card A"
    md5=$(md5sum "User/GC/USA/Card A/01-GP6E-MARIPA6.gci" | cut -d ' ' -f 1)
    if [ $md5 == "4057be554d41ebc34d1b224e5852aafc" ]; then
        echo You now have the correct Mario Party 6 file!
    else
        echo There was an error replacing the Mario Party 6 file...
    fi
    CheckMp7
}

function CheckMp6()
{
    echo ===============================================================================
    md5=$(md5sum "User/GC/USA/Card A/01-GP6E-MARIPA6.gci" | cut -d ' ' -f 1)
    if [ $md5 == "4057be554d41ebc34d1b224e5852aafc" ]; then
        echo Your Mario Party 6 save is correct!
        CheckMp7
    else
        echo 'Your Mario Party 6 save has been changed. Replace?'
        read GCSLOTA
        if [ $GCSLOTA = 'yes' ] || [ $GCSLOTA = 'y' ]
        then
            ReplaceMp6
        else
            CheckMp7
        fi
    fi
}

function ReplaceMp5()
{
    /bin/cp -rf "User/Backup/01-GP5E-MARIPA5.gci" "User/GC/USA/Card A"
    md5=$(md5sum "User/GC/USA/Card A/01-GP5E-MARIPA5.gci" | cut -d ' ' -f 1)
    if [ $md5 == "424fefdbfc1542b3727d440fbd4e538b" ]; then  
        echo You now have the correct Mario Party 5 file!
    else
        echo There was an error replacing the Mario Party 5 file...
    fi
    CheckMp6
}

function CheckMp5()
{
    echo ===============================================================================
    md5=$(md5sum "User/GC/USA/Card A/01-GP5E-MARIPA5.gci" | cut -d ' ' -f 1)
    if [ $md5 == "424fefdbfc1542b3727d440fbd4e538b" ]; then    
        echo Your Mario Party 5 save is correct!
        CheckMp6
    else
        echo 'Your Mario Party 5 save has been changed. Replace?'
        read GCSLOTA
        if [ $GCSLOTA = 'yes' ] || [ $GCSLOTA = 'y' ]
        then
            ReplaceMp5
        else
            CheckMp6
        fi
    fi
}

function ReplaceMp4()
{
    /bin/cp -rf "User/Backup/01-GMPE-MARIPA4BOX0.gci" "User/GC/USA/Card A"
    md5=$(md5sum "User/GC/USA/Card A/01-GMPE-MARIPA4BOX0.gci" | cut -d ' ' -f 1)
    if [ $md5 == "41222ac068d7c1c70214c9fc545beb1d" ]; then
        echo You now have the correct Mario Party 4 file!
    else
        echo There was an error replacing the Mario Party 4 file...
    fi
    CheckMp5
}

function CheckMP4()
{
    echo ===============================================================================
    md5=$(md5sum "User/GC/USA/Card A/01-GMPE-MARIPA4BOX0.gci" | cut -d ' ' -f 1)
    if [ $md5 == "41222ac068d7c1c70214c9fc545beb1d" ]; then
        echo Your Mario Party 4 save is correct!
        CheckMp5
    else
        echo 'Your Mario Party 4 save has been changed. Replace?'
        read GCSLOTA    
        if [ $GCSLOTA = 'yes' ] || [ $GCSLOTA = 'y' ]
        then
            ReplaceMp4
        else
            CheckMp5
        fi
    fi
}

function End()
{
    echo ===============================================================================
    echo The check is done!
    read -p "Press [Enter] to continue..." e
    exit
}

# Start
CheckMP4
End
