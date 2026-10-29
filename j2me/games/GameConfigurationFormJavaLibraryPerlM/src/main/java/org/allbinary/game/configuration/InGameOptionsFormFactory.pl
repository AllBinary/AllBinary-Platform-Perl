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

package org::allbinary::game::configuration::InGameOptionsFormFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{SINGLETON} = 'org::allbinary::graphics::displayable::screen::CommandForm'->getNullCommandForm();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::configuration::InGameOptionsFormFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::configuration::InGameOptionsFormFactory::instance = 'org::allbinary::game::configuration::InGameOptionsFormFactory'->new();
        }
        return $org::allbinary::game::configuration::InGameOptionsFormFactory::instance;
}


sub init {
    my ($self, $commandListener, $initInterface, $title, $backgrounBasicColor, $foregroundBasicColor) = @_;
        try {
            if ($self->{SINGLETON} == 'org::allbinary::graphics::displayable::screen::CommandForm'->getNullCommandForm()) {
                $initInterface->init();
                $self->{SINGLETON} = 'org::allbinary::game::configuration::InGameOptionsForm'->new($commandListener, $title, $backgrounBasicColor, $foregroundBasicColor);
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{INIT}, $e);
        }
}


sub get {
    my ($self) = @_;
        return $self->{SINGLETON};
}

# use javax::microedition::lcdui::CommandListener;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::screen::CommandForm;
use org::allbinary::init::Init;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::configuration::InGameOptionsForm;

1;

