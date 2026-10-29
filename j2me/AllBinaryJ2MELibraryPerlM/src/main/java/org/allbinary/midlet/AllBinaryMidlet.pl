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

package org::allbinary::midlet::AllBinaryMidlet;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::midlet::MIDlet','javax::microedition::lcdui::CommandListener';

our $NULL_ALLBINARY_MIDLET = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{SET_DISPLAY} = "setDisplay";
    $self->{SETTING_} = "Setting: ";
    $self->{_DISPLAY_} = " Display: ";
    $self->{SETTING_NO_TITLE} = "Setting: No Title, Display: ";
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
    $self->{midletDestroyed} = 0;
}


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::midlet::AllBinaryMidlet::NULL_ALLBINARY_MIDLET == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::midlet::AllBinaryMidlet::NULL_ALLBINARY_MIDLET = 'org::allbinary::midlet::AllBinaryMidlet'->new();
        }
        return $org::allbinary::midlet::AllBinaryMidlet::NULL_ALLBINARY_MIDLET;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{CONSTRUCTOR}, $self, "AllBinaryMidlet::AllBinaryMidlet");
    return $self;
}


sub setDisplay {
    my ($self, $newDisplay) = @_;
        my $title = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        if ($newDisplay != $javax::microedition::lcdui::NullCanvas::NULL_CANVAS) {
            $title = $newDisplay->getTitle();
            if (defined($title)) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{SETTING_})->append($title)->append($self->{_DISPLAY_})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($newDisplay))->toString(), $self, $self->{SET_DISPLAY});
            } else {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{SETTING_NO_TITLE})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($newDisplay))->toString(), $self, $self->{SET_DISPLAY});
            }
        }
        my $display = $self->getDisplay();
        $display->setCurrent($newDisplay);
}


sub getDisplay {
    my ($self) = @_;
        return 'javax::microedition::lcdui::Display'->getDisplay($self);
}


sub getCurrentDisplayable {
    my ($self) = @_;
        return 'javax::microedition::lcdui::Display'->getDisplay($self)->getCurrent();
}


sub setDestroyed {
    my ($self, $destroyed) = @_;
        $self->{midletDestroyed} = $destroyed;
}


sub isDestroyed {
    my ($self) = @_;
        return $self->{midletDestroyed};
}


# throws MIDletStateChangeException
sub startApp {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub pauseApp {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub destroyAppInRunnable {
    my ($self, $unconditional, $isProgress) = @_;
}


sub destroyApp {
    my ($self, $unconditional) = @_;
        my $METHOD_NAME = "AllBinaryMidlet::destroyApp";
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $METHOD_NAME);
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::system::Memory'->getInfo(), $self, $METHOD_NAME);
            $self->setDestroyed(1);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $METHOD_NAME, $e);
        }
}


# throws Exception
sub setStartStateHashtable {
    my ($self, $hashtable) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($hashtable))->toString(), $self, "setStartStateHashtable");
        $self->{hashtable} = $hashtable;
}


# throws Exception
sub getStartStateHashtable {
    my ($self) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->{hashtable}))->toString(), $self, "getStartStateHashtable");
        return $self->{hashtable};
}


# throws Exception
sub getCurrentStateHashtable {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getStateHashtable");
        return 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};
}


sub commandAction {
    my ($self, $command, $displayable) = @_;
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Display;
# use javax::microedition::lcdui::Displayable;
# use javax::microedition::lcdui::NullCanvas;
# use javax::microedition::midlet::MIDlet;
# use javax::microedition::midlet::MIDletStateChangeException;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::system::Memory;
use org::allbinary::logic::NullUtil;
use org::allbinary::util::ABHashtable;

1;

