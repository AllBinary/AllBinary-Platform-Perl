#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardInputAutomationProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub process {
    my ($class, $keyActionScriptInputInterface) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $logUtil->putF('org::allbinary::string::CommonLabels'->getInstance()->{START} . $keyActionScriptInputInterface->toString(), "KeyInputAutomationProcessor", $commonStrings->{PROCESS});
        my $inputRobotInterface = $keyActionScriptInputInterface->getInputRobotInterface();
        my $integer = $keyActionScriptInputInterface->getKeyArray();
        if ($keyActionScriptInputInterface->getDelayBetweenKeys() == 0) {
            for (my $index = 0; $index < scalar(@{$keyActionScriptInputInterface->getKeyArray()}); $index++) {
                if ($keyActionScriptInputInterface->isPress()) {
                    $inputRobotInterface->keyPress($integer->[$index]);
                }
            }
            Time::HiRes::sleep(($keyActionScriptInputInterface->getTime()) / 1000);
            for (my $index = scalar(@{$keyActionScriptInputInterface->getKeyArray()}) - 1; $index >= 0; $index--) {
                if ($keyActionScriptInputInterface->isRelease()) {
                    $inputRobotInterface->keyRelease($integer->[$index]);
                }
            }
        } else {
            for (my $index = 0; $index < scalar(@{$keyActionScriptInputInterface->getKeyArray()}); $index++) {
                if ($keyActionScriptInputInterface->isPress()) {
                    $inputRobotInterface->keyPress($integer->[$index]);
                }
                Time::HiRes::sleep(($keyActionScriptInputInterface->getTime()) / 1000);
                if ($keyActionScriptInputInterface->isRelease()) {
                    $inputRobotInterface->keyRelease($integer->[$index]);
                }
                my $timeHelper = 'org::allbinary::time::TimeDelayHelper'->new($keyActionScriptInputInterface->getDelayBetweenKeys());
                my $toLong = 0;
                while (!$timeHelper->isTimeTNT() || $toLong > 6000) {
                    $toLong++;
                    Time::HiRes::sleep((50) / 1000);
                }
            }
        }
}

use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::TimeDelayHelper;
use java::lang::Thread;

1;

