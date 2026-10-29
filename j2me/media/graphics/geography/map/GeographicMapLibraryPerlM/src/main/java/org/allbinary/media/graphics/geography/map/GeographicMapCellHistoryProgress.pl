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

package org::allbinary::media::graphics::geography::map::GeographicMapCellHistoryProgress;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellHistoryProgressBase';


sub _init_fields {
    my ($self) = @_;
    $self->{totalVisitedArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
    $self->{geographicMapCellHistoryArray} = $org::allbinary::media::graphics::geography::map::GeographicMapCellHistory::NULL_GEOGRPAHIC_MAP_HISTORY_ARRAY;
}


sub new {
    my ($class, $geographicMapCellHistoryArray) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{geographicMapCellHistoryArray} = $geographicMapCellHistoryArray;
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{totalVisitedArray} = [(0) x (scalar(@{$self->{geographicMapCellHistoryArray}}))];
}


sub isAnyProgress {
    my ($self) = @_;
        my $isProgressing = 0;
        my $size = scalar(@{$self->{geographicMapCellHistoryArray}});
        my $currentTotalVisited = 0;
        my $totalVisited = 0;
        for (my $index = 0; $index < $size; $index++) {
            $totalVisited = $self->{geographicMapCellHistoryArray}->[$index]->getTotalVisited();
            $currentTotalVisited = $self->{totalVisitedArray}->[$index];
            if ($currentTotalVisited < $totalVisited) {
                $isProgressing = 1;
                $self->{totalVisitedArray}->[$index] = $totalVisited;
            }
        }
        return $isProgressing;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistoryProgressBase;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;

1;

