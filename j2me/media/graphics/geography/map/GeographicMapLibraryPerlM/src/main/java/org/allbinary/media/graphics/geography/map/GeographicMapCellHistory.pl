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

package org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::font::UpdateMyFontInterface';

our $NULL_GEOGRPAHIC_MAP_HISTORY_ARRAY = [(undef) x (0)];

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{booleanFactory} = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance();
    $self->{list} = undef;
    $self->{visitedList} = undef;
    $self->{MISSED_INFO} = "Missed";
    $self->{animation} = 'org::allbinary::animation::text::TextAnimation'->new($self->{MISSED_INFO}, 'org::allbinary::animation::AnimationBehavior'->getInstance());
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{totalVisited} = 0;
    $self->{halfWidth} = 0;
    $self->{fontHeight} = 0;
    $self->{RED} = int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED});
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{visitedList} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->init();
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{fontHeight} = $font->getHeight();
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub getTotalVisited {
    my ($self) = @_;
        return $self->{totalVisited};
}


sub getTotalNotVisited {
    my ($self) = @_;
        return $self->getSize() - $self->{totalVisited};
}


sub getSize {
    my ($self) = @_;
        return $self->{list}->size();
}


sub trackAll {
    my ($self, $list) = @_;
        my $size = $list->size();
        $self->{list}->ensureCapacity($size);
        $self->{visitedList}->ensureCapacity($size);
        my $geographicMapCellPosition = undef;
        for (my $index = 0; $index < $size; $index++) {
            $geographicMapCellPosition = $list->get($index);
            $self->track($geographicMapCellPosition);
        }
}


sub track {
    my ($self, $geographicMapCellPosition) = @_;
        if (!$self->{list}->contains($geographicMapCellPosition)) {
            $self->{list}->add($geographicMapCellPosition);
            $self->{visitedList}->add($self->{booleanFactory}->{FALSE});
        }
}


sub getTracked {
    my ($self) = @_;
        return $self->{list};
}


sub getVisited {
    my ($self) = @_;
        return $self->{visitedList};
}


sub getAfterIfNotLast {
    my ($self, $geographicMapCellPosition) = @_;
        my $localList = $self->{list};
        my $index = $localList->indexOf($geographicMapCellPosition);
        if ($localList->size() > $index + 1) {
            return $localList->get($index + 1);
        }
        return $geographicMapCellPosition;
}


sub getFirstUnvisited {
    my ($self) = @_;
        my $localList = $self->{list};
        my $localVisitedList = $self->{visitedList};
        my $size = $localVisitedList->size();
        my $value = undef;
        for (my $index = 0; $index < $size; $index++) {
            $value = $self->{visitedList}->get($index);
            if ($value == $self->{booleanFactory}->{FALSE}) {
                return $localList->get($index);
            }
        }
        return $localList->get(0);
}


sub getFirstUnvisitedIndex {
    my ($self) = @_;
        my $localVisitedList = $self->{visitedList};
        my $size = $localVisitedList->size();
        my $value = undef;
        for (my $index = 0; $index < $size; $index++) {
            $value = $self->{visitedList}->get($index);
            if ($value == $self->{booleanFactory}->{FALSE}) {
                return $index;
            }
        }
        return 0;
}


sub getInPathButNotTracked {
    my ($self, $pathList) = @_;
        my $inPathButNotTrackedList = 'org::allbinary::util::BasicArrayListD'->new();
        my $localList = $self->{list};
        my $size = $pathList->size();
        my $geographicMapCellPosition = undef;
        for (my $index = 0; $index < $size; $index++) {
            $geographicMapCellPosition = $pathList->get($index);
            if (!$localList->contains($geographicMapCellPosition)) {
                $inPathButNotTrackedList->add($geographicMapCellPosition);
            }
        }
        return $inPathButNotTrackedList;
}


sub isVisited {
    my ($self, $geographicMapCellPosition) = @_;
        my $index = $self->{list}->indexOf($geographicMapCellPosition);
        if ($index != -1) {
            my $value = $self->{visitedList}->get($index);
            if ($value == $self->{booleanFactory}->{TRUE}) {
                return 1;
            }
        } else {
        }
        return 0;
}


sub visit {
    my ($self, $geographicMapCellPosition) = @_;
        my $index = $self->{list}->indexOf($geographicMapCellPosition);
        my $value = undef;
        if ($index != -1) {
            $value = $self->{visitedList}->get($index);
            my $TRUE = $self->{booleanFactory}->{TRUE};
            if ($value != $TRUE) {
                $self->{visitedList}->set($index, $TRUE);
                $self->{totalVisited}++;
                return 1;
            }
        } else {
        }
        return 0;
}


# throws Exception
sub isAllVisited {
    my ($self) = @_;
        if ($self->{totalVisited} == $self->getSize() - 1) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub isAllVisited2 {
    my ($self) = @_;
        if ($self->{totalVisited} == $self->getSize()) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub isPortionVisited {
    my ($self, $basicDecimal) = @_;
        my $size = $self->getSize();
        my $numberRequired = int(($size << $basicDecimal->getScaledFactor()) / int($basicDecimal->getUnscaled()));
        my $numberNotVisited = $self->getSize() - 1 - $self->{totalVisited};
        if ($size - $numberNotVisited > $numberRequired) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub reset {
    my ($self) = @_;
        my $localVisitedList = $self->{visitedList};
        my $localFalseBoolean = $self->{booleanFactory}->{FALSE};
        my $size = $localVisitedList->size();
        for (my $index = $size - 1; $index >= 0; $index--) {
            $localVisitedList->set($index, $localFalseBoolean);
        }
        $self->{totalVisited} = 0;
}


sub paintNotVisitedRelativeToPoint {
    my ($self, $graphics, $tiledLayer, $point) = @_;
        my $x = $point->getX() - $tiledLayer->getXP();
        my $y = $point->getY() - $tiledLayer->getYP();
        if ($self->{halfWidth} == 0) {
            $self->{halfWidth} = (POSIX::floor(($graphics->getFont()->stringWidth($self->{MISSED_INFO})) / (2 ** (1))));
        }
        my $height = 2 * $self->{fontHeight};
        $self->{animation}->paintXY($graphics, $x + $self->{halfWidth}, $y + ($height));
}


sub paintNotVisited {
    my ($self, $graphics, $geographicMapInterface) = @_;
        try {
            $self->{myFontProcessor}->process($graphics);
            $graphics->setColor($self->{RED});
            my $localVisitedList = $self->{visitedList};
            my $size = $localVisitedList->size();
            my $geographicMapCellPosition = undef;
            my $isCellVisitedBoolean = undef;
            for (my $index = $size; --$index >= 0; ) {
                $geographicMapCellPosition = $self->{list}->get($index);
                $isCellVisitedBoolean = $localVisitedList->get($index);
                if (!$isCellVisitedBoolean) {
                    $self->paintNotVisitedRelativeToPoint($graphics, $geographicMapInterface->getAllBinaryTiledLayer(), $geographicMapCellPosition->getPoint());
                }
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "paintNotVisited", $e);
        }
}


sub init {
    my ($self) = @_;
        $self->{list}->clear();
        $self->{visitedList}->clear();
        $self->{totalVisited} = 0;
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::text::TextAnimation;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::logic::math::BasicDecimal;

1;

