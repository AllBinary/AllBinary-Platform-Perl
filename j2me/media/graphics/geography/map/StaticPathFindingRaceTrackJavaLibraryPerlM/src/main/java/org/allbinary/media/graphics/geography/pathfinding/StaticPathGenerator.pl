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

package org::allbinary::media::graphics::geography::pathfinding::StaticPathGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::pathfinding::PathGeneratorInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        'org::allbinary::logic::communication::log::PreLogUtil'->put("Using Static Path Finding", $self, 'org::allbinary::string::CommonStrings'->getInstance()->{CONSTRUCTOR});
    return $self;
}


# throws Exception
sub init {
    my ($self, $geographicMapInterface, $totalPaths) = @_;
}


# throws Exception
sub getGeographicMapCellPositionListFromBasicGeographicMapCellPositionList {
    my ($self, $geographicMapCellPositionFactory, $pathList) = @_;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $pathList->size();
        my $basicGeographicMapCellPosition = undef;
        my $geographicMapCellPosition = undef;
        for (my $index = 0; $index < $size; $index++) {
            $basicGeographicMapCellPosition = $pathList->get($index);
            $geographicMapCellPosition = $geographicMapCellPositionFactory->getAt($basicGeographicMapCellPosition->getColumn(), $basicGeographicMapCellPosition->getRow());
            $list->add($geographicMapCellPosition);
        }
        return $list;
}


# throws Exception
sub createList {
    my ($self, $geographicMapInterface, $geographicMapCellHistory, $pathFindingInfo, $totalPaths) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            my $pathCacheFactory = 'org::allbinary::media::graphics::geography::pathfinding::PathCacheFactory'->getInstance();
            my $mapIdInteger = $geographicMapInterface->getAllBinaryTiledLayer()->getDataId();
            my $list = $pathCacheFactory->getOrCreate($mapIdInteger);
            if ($list == $self->{basicArrayListUtil}->getImmutableInstance()) {
                $list = 'org::allbinary::util::BasicArrayListD'->new();
                my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
                my $geographicMapCellPositionFactory = $geographicMapInterface->getGeographicMapCellPositionFactory();
                my $id = 'org::allbinary::media::graphics::geography::map::PathData'->getInstance()->{OFFSET} + int($mapIdInteger);
                my $basicList = $pathCacheFactory->getOrCreate($smallIntegerSingletonFactory->getAt($id));
                my $size = $basicList->size();
                my $pathList = undef;
                for (my $index = 0; $index < $size; $index++) {
                    $pathList = $self->getGeographicMapCellPositionListFromBasicGeographicMapCellPositionList($geographicMapCellPositionFactory, $basicList->get($index));
                    $list->add($pathList);
                }
                $pathCacheFactory->add($mapIdInteger, $list);
                $pathCacheFactory->remove($smallIntegerSingletonFactory->getAt($id));
            }
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Using Cached Path(s): ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($list))->toString(), $self, $commonStrings->{GET_INSTANCE});
            return $list;
        } catch ($e) {
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            return 'org::allbinary::util::BasicArrayListD'->new();
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::graphics::CellPosition;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::media::graphics::geography::map::BasicGeographicMap;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellHistory;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;
use org::allbinary::media::graphics::geography::map::PathData;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::media::graphics::geography::pathfinding::PathGeneratorInterface;
use org::allbinary::media::graphics::geography::pathfinding::PathCacheFactory;

1;

