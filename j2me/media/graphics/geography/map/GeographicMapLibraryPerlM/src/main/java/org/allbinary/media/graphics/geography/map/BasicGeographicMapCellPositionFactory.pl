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

package org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{geographicMapCellPositionArray} = undef;
    $self->{geographicMapInterface} = undef;
    $self->{geographicMapCellPositionFactoryInterface} = undef;
    $self->{columns} = undef;
    $self->{rows} = undef;
    $self->{tiledLayer} = undef;
}


sub new {
    my ($class, $geographicMapInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{geographicMapInterface} = $geographicMapInterface;
        $self->{geographicMapCellPositionFactoryInterface} = $self->{geographicMapInterface}->getGeographicMapCellPositionFactoryInterface();
        $self->{tiledLayer} = $self->{geographicMapInterface}->getAllBinaryTiledLayer();
        $self->{columns} = $self->{tiledLayer}->getColumns();
        $self->{rows} = $self->{tiledLayer}->getRows();
        $self->{geographicMapCellPositionArray} = [map { [(undef) x ($self->{columns})] } 1 .. ($self->{rows})];
        $self->init();
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        my $tiledLayer = $self->{tiledLayer};
        my $columns = $self->getColumns();
        my $rows = $self->getRows();
        my $width = $tiledLayer->getCellWidth();
        my $height = $tiledLayer->getCellHeight();
        for (my $column = 0; $column < $columns; $column++) {
            for (my $row = 0; $row < $rows; $row++) {
                $self->createInstance($column, $row, $width, $height);
            }
        }
}


# throws Exception
sub visit {
    my ($self, $geographicMapCelPositionFactoryInitVisitorInterface) = @_;
        my $tiledLayer = $self->{tiledLayer};
        my $columns = $self->getColumns();
        my $rows = $self->getRows();
        try {
            my $cellPosition = undef;
            for (my $column = 0; $column < $columns; $column++) {
                for (my $row = 0; $row < $rows; $row++) {
                    $cellPosition = $self->getAt($column, $row);
                    $geographicMapCelPositionFactoryInitVisitorInterface->visit($tiledLayer, $cellPosition);
                }
            }
        } catch ($e) {
            my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
            $self->{logUtil}->put('org::allbinary::logic::string::StringMaker'->new()->append($commonSeps->{BRACKET_OPEN})->appendint($rows)->append($commonSeps->{BRACKET_CLOSE})->append($commonSeps->{BRACKET_OPEN})->appendint($columns)->append($commonSeps->{BRACKET_CLOSE})->toString(), $self, "visit", $e);
            die $e;
        }
}


# throws Exception
sub getAt {
    my ($self, $i_column, $i_row) = @_;
        return $self->{geographicMapCellPositionArray}->[$i_row]->[$i_column];
}


# throws Exception
sub getInstance {
    my ($self, $anotherMapGeographicMapCellPosition) = @_;
        return $self->getAt($anotherMapGeographicMapCellPosition->getColumn(), $anotherMapGeographicMapCellPosition->getRow());
}


# throws Exception
sub createInstance {
    my ($self, $i_column, $i_row, $width, $height) = @_;
        my $cellPositionCanBeNull = $self->{geographicMapCellPositionArray}->[$i_row]->[$i_column];
        if (!defined($cellPositionCanBeNull)) {
            $cellPositionCanBeNull = $self->{geographicMapCellPositionFactoryInterface}->getInstance($self->{geographicMapInterface}, $i_column, $i_row, $self->{columns}, $self->{rows}, $width, $height);
            $self->{geographicMapCellPositionArray}->[$i_row]->[$i_column] = $cellPositionCanBeNull;
        }
        return $cellPositionCanBeNull;
}


sub getColumns {
    my ($self) = @_;
        return $self->{columns};
}


sub getRows {
    my ($self) = @_;
        return $self->{rows};
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

