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

package org::allbinary::input::motion::button::BasicTouchInputFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{SPECIAL_BUTTON_SEVEN_TESTING_ONLY} = undef;
    $self->{SPECIAL_BUTTON_EIGHT_TESTING_ONLY} = undef;
    $self->{SPECIAL_BUTTON_SIX} = undef;
    $self->{SPECIAL_BUTTON_FIVE} = undef;
    $self->{SPECIAL_BUTTON_FOUR} = undef;
    $self->{SPECIAL_BUTTON_THREE} = undef;
    $self->{SPECIAL_BUTTON_TWO} = undef;
    $self->{SPECIAL_BUTTON_ONE} = undef;
    $self->{UP} = undef;
    $self->{LEFT} = undef;
    $self->{RIGHT} = undef;
    $self->{DOWN} = undef;
    $self->{NONE} = undef;
    $self->{initialized} = 0;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::input::motion::button::BasicTouchInputFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::input::motion::button::BasicTouchInputFactory::instance = 'org::allbinary::input::motion::button::BasicTouchInputFactory'->new();
        }
        return $org::allbinary::input::motion::button::BasicTouchInputFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $MAX = 'org::allbinary::game::input::InputFactory'->getInstance()->{MAX};
        $self->{SPECIAL_BUTTON_SEVEN_TESTING_ONLY} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 41, "Button 7 - Testing Only May Cross Over Key Values");
        $self->{SPECIAL_BUTTON_EIGHT_TESTING_ONLY} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 42, "Button 8 - Testing Only May Cross Over Key Values");
        $self->{SPECIAL_BUTTON_SIX} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 30, "Button 6");
        $self->{SPECIAL_BUTTON_FIVE} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 31, "Button 5");
        $self->{SPECIAL_BUTTON_FOUR} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 32, "Button 4");
        $self->{SPECIAL_BUTTON_THREE} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 33, "Button 3");
        $self->{SPECIAL_BUTTON_TWO} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 34, "Button 2");
        $self->{SPECIAL_BUTTON_ONE} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 35, "Button 1");
        $self->{UP} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 36, "Up Button");
        $self->{LEFT} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 37, "Left Button");
        $self->{RIGHT} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 38, "Right Button");
        $self->{DOWN} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 39, "Down Button");
        $self->{NONE} = 'org::allbinary::input::motion::button::TouchButtonInput'->new($MAX - 40, "No Button");
    return $self;
}


sub init {
    my ($self, $inputToGameKeyMapping) = @_;
        if (!$self->{initialized}) {
            $self->{initialized} = 1;
            $self->{list}->add($self->{UP});
            $self->{list}->add($self->{LEFT});
            $self->{list}->add($self->{RIGHT});
            $self->{list}->add($self->{DOWN});
            $self->{list}->add($self->{SPECIAL_BUTTON_TWO});
            $self->{list}->add($self->{SPECIAL_BUTTON_FOUR});
            $self->{list}->add($self->{SPECIAL_BUTTON_THREE});
            $self->{list}->add($self->{SPECIAL_BUTTON_ONE});
            $self->{list}->add($self->{SPECIAL_BUTTON_FIVE});
            $self->{list}->add($self->{SPECIAL_BUTTON_SIX});
            $self->{list}->add($self->{SPECIAL_BUTTON_SIX});
            $self->{list}->add($self->{SPECIAL_BUTTON_SEVEN_TESTING_ONLY});
            $self->{list}->add($self->{SPECIAL_BUTTON_EIGHT_TESTING_ONLY});
            $self->updateAllFromList($self->{list}, $inputToGameKeyMapping);
        }
}


sub updateAll {
    my ($self, $inputToGameKeyMapping) = @_;
        $self->updateAllFromList($self->{list}, $inputToGameKeyMapping);
}


sub updateAllFromList {
    my ($self, $list, $inputToGameKeyMapping) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->appendint($list->size())->toString(), $self, "updateAll");
        my $touchButtonInput = undef;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            $touchButtonInput = $list->{objectArray}->[$index];
            $touchButtonInput->update($inputToGameKeyMapping);
        }
}


sub getList {
    my ($self) = @_;
        return $self->{list};
}

use org::allbinary::game::input::InputFactory;
use org::allbinary::game::input::mapping::InputToGameKeyMapping;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::motion::button::TouchButtonInput;

1;

