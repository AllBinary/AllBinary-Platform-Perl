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

package org::allbinary::game::displayable::canvas::StartIntermissionProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::Processor';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{gameCanvas} = undef;
    $self->{WAIT} = 5000;
}


sub new {
    my ($class, $gameCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{gameCanvas} = $gameCanvas;
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        if ($self->{gameCanvas}->getStartIntermissionInterface()->getTimeDelayHelper()->isElapsedTNT($self->{WAIT})) {
            $self->{logUtil}->putF("Intermission End", $self, $self->{commonStrings}->{PROCESS});
            $self->{gameCanvas}->getStartIntermissionInterface()->setEnabled(0);
        }
}

use org::allbinary::canvas::Processor;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

