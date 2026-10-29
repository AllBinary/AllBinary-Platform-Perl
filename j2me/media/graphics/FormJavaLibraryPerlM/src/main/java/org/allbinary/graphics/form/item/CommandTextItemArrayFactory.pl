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

package org::allbinary::graphics::form::item::CommandTextItemArrayFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{visitorInterface} = undef;
}


sub new {
    my ($class, $visitorInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{visitorInterface} = $visitorInterface;
    return $self;
}


sub getInstance {
    my ($self, $vector, $backgroundBasicColor, $foregroundBasicColor) = @_;
        my $vectorUtil = 'org::allbinary::logic::VectorUtil'->getInstance();
        my $size = $vectorUtil->getSize($vector);
        $self->{list}->clear();
        my $textItem = undef;
        my $priorityLimit = 7;
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        my $isLargeEnoughDisplayForBigMenu = ($displayInfo->isPortrait() && $displayInfo->getLastHeight() >= 'org::allbinary::graphics::form::ScreenInfo'->getInstance()->{MEDIUM_WIDTH}) || (!$displayInfo->isPortrait() && $displayInfo->getLastWidth() >= 'org::allbinary::graphics::form::ScreenInfo'->getInstance()->{MEDIUM_WIDTH});
        if (!$isLargeEnoughDisplayForBigMenu && $size > 3) {
            $priorityLimit = 3;
        }
        my $command = undef;
        for (my $index = 0; $index < $size; $index++) {
            $command = $vectorUtil->elementAt($vector, $index);
            if ($command->getPriority() < $priorityLimit) {
                my $aBoolean = $self->{visitorInterface}->visit($command);
                if ($aBoolean) {
                    $textItem = 'org::allbinary::graphics::form::item::CommandTextItem'->new($command, $javax::microedition::lcdui::ImageItem::LAYOUT_DEFAULT, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $backgroundBasicColor, $foregroundBasicColor);
                    $self->{list}->add($textItem);
                }
            }
        }
        my $textItemArray = [(undef) x ($self->{list}->size())];
        my $size2 = scalar(@{$textItemArray});
        for (my $index = 0; $index < $size2; $index++) {
            $textItemArray->[$index] = $self->{list}->{objectArray}->[$index];
        }
        return $textItemArray;
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::ImageItem;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::form::ScreenInfo;
use org::allbinary::logic::VectorUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::form::item::CommandTextItem;

1;

