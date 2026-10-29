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

package org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingletonDebug;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingleton';

our $instanceC = 'org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingletonDebug'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{string} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{listString} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{append} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{PRESSED_AND_FIRED} = "pressed & fired";
    $self->{PRESSED_AND_NOT_FIRED} = "pressed in button but not fired";
    $self->{ASSOCIATED_RELEASED_AND_FIRED} = "assoc. rel & fired";
    $self->{RELEASED_AND_FIRED} = "rel & fired 1";
    $self->{RELEASED_AND_FIRED_2} = "rel & fired 2";
    $self->{RELEASED_AND_NOT_FIRED} = "rel & not fired";
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingletonDebug::instanceC;
}


sub appendTouchButtonInput {
    my ($self, $append, $touchButtonInput) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($touchButtonInput->toString());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($append);
        $self->{append} = $stringBuffer->toString();
        $self->{string} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{listString})->append($self->{append})->toString();
}


sub append {
    my ($self, $append) = @_;
        $self->{append} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{append})->append($append)->toString();
        $self->{string} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{listString})->append($self->{append})->toString();
}


sub clearLog {
    my ($self, $x, $y) = @_;
        $self->{append} = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::graphics::GPoint'->toStringStatic($x, $y, 0))->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->toString();
        $self->{string} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{listString})->append($self->{append})->toString();
}


sub releaseAndNotFired {
    my ($self) = @_;
        $self->append($self->{RELEASED_AND_NOT_FIRED});
}


sub releaseAndFired {
    my ($self, $touchButtonInput) = @_;
        $self->appendTouchButtonInput($self->{RELEASED_AND_FIRED}, $touchButtonInput);
}


sub releaseAndFired2 {
    my ($self, $touchButtonInput) = @_;
        $self->appendTouchButtonInput($self->{RELEASED_AND_FIRED_2}, $touchButtonInput);
}


sub releaseAndFiredAssociated {
    my ($self, $touchButtonInput) = @_;
        $self->appendTouchButtonInput($self->{ASSOCIATED_RELEASED_AND_FIRED}, $touchButtonInput);
}


sub pressedAndFired {
    my ($self, $touchButtonInput) = @_;
        $self->appendTouchButtonInput($self->{PRESSED_AND_FIRED}, $touchButtonInput);
}


sub pressedAndNotFired {
    my ($self, $touchButtonInput) = @_;
        $self->appendTouchButtonInput($self->{PRESSED_AND_NOT_FIRED}, $touchButtonInput);
}


sub removeAt {
    my ($self, $index) = @_;
        my $touchButtonInput = $self->SUPER::removeAt($index);
        $self->{listString} = $self->{list}->toString();
        $self->{string} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{listString})->append($self->{append})->toString();
        return $touchButtonInput;
}


sub remove {
    my ($self, $touchButtonInput) = @_;
        my $isRemoved = $self->SUPER::remove($touchButtonInput);
        $self->{listString} = $self->{list}->toString();
        $self->{string} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{listString})->append($self->{append})->toString();
        return $isRemoved;
}


sub add {
    my ($self, $touchButtonInput) = @_;
        $self->SUPER::add($touchButtonInput);
        $self->{listString} = $self->{list}->toString();
        $self->{string} = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{listString})->append($self->{append})->toString();
}


sub toString {
    my ($self) = @_;
        return $self->{string};
}

use org::allbinary::graphics::GPoint;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::input::motion::button::CurrentlyPressedTouchButtonSingleton;

1;

