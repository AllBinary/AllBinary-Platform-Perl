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

package org::allbinary::input::automation::actions::script::condition::processors::input::MouseInputAutomationProcessor;
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
    my ($class, $mouseActionScriptInputInterface) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $logUtil->putF('org::allbinary::logic::string::StringMaker'->new()->append("Start - Processing Mouse Input at: ")->append($mouseActionScriptInputInterface->getPoint()->toString())->append(" clicks: ")->appendint(int($mouseActionScriptInputInterface->getButtonClicks()))->toString(), "MouseInputAutomationProcessor", $commonStrings->{PROCESS});
        my $inputRobotInterface = $mouseActionScriptInputInterface->getInputRobotInterface();
        if ($mouseActionScriptInputInterface->getPoint()->{x} != -1 && $mouseActionScriptInputInterface->getPoint()->{y} != -1) {
            $inputRobotInterface->mouseMove($mouseActionScriptInputInterface->getPoint());
        }
        Time::HiRes::sleep(($mouseActionScriptInputInterface->getTime()) / 1000);
        if ($mouseActionScriptInputInterface->getButtonClicks() != 0) {
            $inputRobotInterface->mousePress($mouseActionScriptInputInterface->getButtonClicks());
            Time::HiRes::sleep(($mouseActionScriptInputInterface->getTime()) / 1000);
            $inputRobotInterface->mouseRelease($mouseActionScriptInputInterface->getButtonClicks());
        }
        Time::HiRes::sleep(($mouseActionScriptInputInterface->getTime()) / 1000);
}

use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use java::lang::Thread;

1;

