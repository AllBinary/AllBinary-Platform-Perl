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

package org::allbinary::input::automation::module::TestInputAutomationActionWorker;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::input::automation::module::AbstractInputAutomationWorker';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{sleep} = undef;
}


sub new {
    my ($class, $sleep, $inputAutomationActionInterface, $imageComparatorConstraintsInterface, $motionRectangleConstraintsInterface) = @_;
    my $self = $class->SUPER::new($inputAutomationActionInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF("BasicTestAttackWorder", $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->{sleep} = $sleep;
    return $self;
}


# throws Exception
sub processBetweenWorkers {
    my ($self) = @_;
        Time::HiRes::sleep((2000) / 1000);
}


# throws Exception
sub process {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{PROCESS});
        my $hashtable = 'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->get();
        my $set = $hashtable->keySet();
        my $inputTypeNameArray = $set->toArray();
        my $size = scalar(@{$inputTypeNameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $inputTypeNameString = $inputTypeNameArray->[$index];
            my $robot = $hashtable->get($inputTypeNameString);
            if ($self->{sleep} > 0) {
                Time::HiRes::sleep(($self->{sleep}) / 1000);
            }
        }
}

# use java::util::Set;
use org::allbinary::input::automation::robot::InputRobotFactory;
use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::comparison::ImageComparatorConstraintsInterface;
use org::allbinary::media::image::comparison::motion::MotionRectangleConstraintsInterface;
use org::allbinary::util::ABHashtable;
use org::allbinary::input::automation::module::AbstractInputAutomationWorker;
use java::lang::Thread;

1;

