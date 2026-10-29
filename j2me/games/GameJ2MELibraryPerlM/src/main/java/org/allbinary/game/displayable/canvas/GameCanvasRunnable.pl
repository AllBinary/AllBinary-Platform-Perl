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

package org::allbinary::game::displayable::canvas::GameCanvasRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::GameRunnable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{gameTickDisplayInfoSingleton} = 'org::allbinary::graphics::displayable::GameTickDisplayInfoSingleton'->getInstance();
    $self->{allBinaryGameCanvas} = undef;
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
}


sub new {
    my ($class, $allBinaryGameCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{allBinaryGameCanvas} = $allBinaryGameCanvas;
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            $self->{allBinaryGameCanvas}->getLoopTimeHelperP()->setStartTime($self->{gameTickTimeDelayHelper}->setStartTime());
            $self->{gameTickDisplayInfoSingleton}->update();
            $self->{allBinaryGameCanvas}->processGame();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}


# throws Exception
sub processLoopSleep {
    my ($self) = @_;
        $self->{allBinaryGameCanvas}->processLoopSleep();
}

use org::allbinary::graphics::displayable::GameTickDisplayInfoSingleton;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::game::displayable::canvas::GameRunnable;

1;

