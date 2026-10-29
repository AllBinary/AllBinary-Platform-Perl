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

package org::allbinary::game::configuration::GameConfigurationTextInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
our $SIMULATOR_IP = 'org::allbinary::game::configuration::GameConfigurationTextInput'->new("IP: ", "192.168.1.3");
our $SIMULATOR_PORT = 'org::allbinary::game::configuration::GameConfigurationTextInput'->new("Port: ", "8010");

sub _init_fields {
    my ($self) = @_;
    $self->{label} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{text} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $label, $text) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setText($text);
        $self->setLabel($label);
        $org::allbinary::game::configuration::GameConfigurationTextInput::hashtable->put($self->getLabel(), $self);
    return $self;
}


sub update {
    my ($class, $textField) = @_;
        my $anyType = $textField->getLabel();
        my $gameConfigurationTextInput = $org::allbinary::game::configuration::GameConfigurationTextInput::hashtable->get($anyType);
        $gameConfigurationTextInput->setText($textField->getString());
}


sub setText {
    my ($self, $text) = @_;
        $self->{text} = $text;
}


sub getText {
    my ($self) = @_;
        return $self->{text};
}


sub setLabel {
    my ($self, $label) = @_;
        $self->{label} = $label;
}


sub getLabel {
    my ($self) = @_;
        return $self->{label};
}


sub getHashtable {
    my ($class) = @_;
        return $org::allbinary::game::configuration::GameConfigurationTextInput::hashtable;
}

# use javax::microedition::lcdui::TextField;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::ABHashtable;

1;

