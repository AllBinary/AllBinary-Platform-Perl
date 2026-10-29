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

package org::allbinary::game::paint::help::BasicInputMappingHelpPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::paint::help::HelpPaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{gameInputMappingArray} = undef;
    $self->{NONE} = 'org::allbinary::game::input::GameKeyFactory'->getInstance()->{NONE};
}


sub new {
    my ($class, $gameInputMappingArray, $basicColor) = @_;
    my $self = $class->SUPER::new("Help Screen", 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK}, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{gameInputMappingArray} = $gameInputMappingArray;
        $self->update($self->{NONE}, $self->{NONE});
    return $self;
}


sub update {
    my ($self, $selectedGameKey, $selectedInput) = @_;
        my $gameKeyMapping = 'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance();
        my $EQUAL = " = ";
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = scalar(@{$self->{gameInputMappingArray}});
        my $keyInfo = [(undef) x ($size)];
        my $gameInputMapping = undef;
        my $gameKey = undef;
        my $list = undef;
        for (my $index = 0; $index < $size; $index++) {
            $gameInputMapping = $self->{gameInputMappingArray}->[$index];
            $gameKey = $gameInputMapping->getGameKey();
            $list = $gameKeyMapping->getInputMapping()->getMappedInput($gameKey);
            $stringMaker->delete(0, $stringMaker->length());
            $keyInfo->[$index] = $stringMaker->append($gameInputMapping->getName())->append($EQUAL)->append($self->get($list))->toString();
        }
        $self->SUPER::setInputInfoP($keyInfo);
}


sub get {
    my ($self, $keyList) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $AND = "and ";
        my $key = undef;
        my $size = $keyList->size();
        for (my $index = 0; $index < $size; $index++) {
            $key = $keyList->{objectArray}->[$index];
            $stringBuffer->append($key->getName());
            if ($index + 1 < $keyList->size()) {
                if ($keyList->size() == 2) {
                    $stringBuffer->append($commonSeps->{SPACE})->append($AND);
                } else {
                    if ($index + 2 == $keyList->size()) {
                        $stringBuffer->append($commonSeps->{COMMA_SEP});
                        $stringBuffer->append($AND);
                    } else {
                        $stringBuffer->append($commonSeps->{COMMA_SEP});
                    }
                }
            }
        }
        return $stringBuffer->toString();
}

use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::PlatformInputMappingFactory;
use org::allbinary::game::input::mapping::GameInputMapping;
use org::allbinary::game::input::mapping::PersistentInputMapping;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::paint::help::HelpPaintable;

1;

