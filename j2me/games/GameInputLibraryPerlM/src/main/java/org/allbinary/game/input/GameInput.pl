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

package org::allbinary::game::input::GameInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{gameKeyEventList} = undef;
    $self->{removalGameKeyEventList} = undef;
    $self->{isRemoveDuplicateKeyPresses} = undef;
}


sub new {
    my ($class, $gameKeyEventList, $removalGameKeyEventList) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{gameKeyEventList} = $gameKeyEventList;
        $self->{removalGameKeyEventList} = $removalGameKeyEventList;
        $self->{isRemoveDuplicateKeyPresses} = 'org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::InputFeatureFactory'->getInstance()->{REMOVE_DUPLICATE_KEY_PRESSES});
    return $self;
}


sub add {
    my ($self, $gameKeyEvent) = @_;
        if ($self->{isRemoveDuplicateKeyPresses} && $self->{gameKeyEventList}->contains($gameKeyEvent)) {
            return;
        }
        if (defined($gameKeyEvent)) {
            $self->{gameKeyEventList}->add($gameKeyEvent);
        } else {
            $self->{logUtil}->putF("Danger Passed Null GameKeyEvent", $self, $self->{commonStrings}->{ADD});
        }
}


sub addForRemoval {
    my ($self, $gameKeyEvent) = @_;
        $self->{removalGameKeyEventList}->add($gameKeyEvent);
}


sub isForRemoval {
    my ($self, $gameKeyEvent) = @_;
        return $self->{removalGameKeyEventList}->contains($gameKeyEvent);
}


sub clear {
    my ($self) = @_;
        $self->{gameKeyEventList}->clear();
}


sub removeNonAIInputGameKeyEvents {
    my ($self) = @_;
        my $list = $self->{gameKeyEventList};
        my $gameKeyEvent = undef;
        for (my $index = $list->size(); --$index >= 0; ) {
            $gameKeyEvent = $list->{objectArray}->[$index];
            if ($gameKeyEvent->getSourceId() != 1) {
                $list->removeAt($index);
            }
        }
}


sub update {
    my ($self) = @_;
        my $removeList = $self->{removalGameKeyEventList};
        my $list = $self->{gameKeyEventList};
        my $size = $removeList->size();
        for (my $index = 0; $index < $size; $index++) {
            my $anyType = $removeList->{objectArray}->[$index];
            for (my $index2 = $list->size(); --$index2 >= 0; ) {
                if ($list->{objectArray}->[$index2] == $anyType) {
                    $list->removeAt($index2);
                }
            }
        }
        $removeList->clear();
}


sub getRemovalGameKeyEventList {
    my ($self) = @_;
        return $self->{removalGameKeyEventList};
}


sub getGameKeyEventList {
    my ($self) = @_;
        return $self->{gameKeyEventList};
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::InputFeatureFactory;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;

1;

