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

package org::allbinary::midlet::ExitRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{midlet} = undef;
    $self->{processor} = undef;
    $self->{isProgress} = undef;
}


sub new {
    my ($class, $midlet, $processor, $isProgress) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{midlet} = $midlet;
        $self->{isProgress} = $isProgress;
        $self->{processor} = $processor;
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
            $self->{midlet}->destroyAppInRunnable(0, $self->{isProgress});
            $self->{midlet}->setDisplay($javax::microedition::lcdui::NullCanvas::NULL_CANVAS);
            $self->{midlet}->notifyDestroyed();
            $self->{logUtil}->putF($self->{commonStrings}->{END_RUNNABLE}, $self, $self->{commonStrings}->{RUN});
            $self->{processor}->process();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
            try {
                $self->{processor}->process();
            } catch ($e2) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{RUN}, $e);
            }
        }
}

# use javax::microedition::lcdui::NullCanvas;
use org::allbinary::canvas::Processor;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

