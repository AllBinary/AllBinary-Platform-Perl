# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::AllBinaryTiledLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::layer::Layer','org::allbinary::layer::NamedInterface','org::allbinary::graphics::paint::PaintableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{cellWidth} = undef;
    $self->{cellHeight} = undef;
    $self->{halfWidth} = undef;
    $self->{halfHeight} = undef;
    $self->{halfCellWidth} = undef;
    $self->{halfCellHeight} = undef;
    $self->{dataId} = undef;
}


sub new {
    my ($class, $dataId, $width, $height, $cellWidth, $cellHeight) = @_;
    my $self = $class->SUPER::new(0, 0);
    $self->_init_fields();
        # super(...) made $self above
        $self->{dataId} = $dataId;
        $self->setLayerWidth($width);
        $self->setLayerHeight($height);
        $self->SUPER::setPosition(0, 0, 0);
        $self->{cellWidth} = $cellWidth;
        $self->{cellHeight} = $cellHeight;
        $self->{halfWidth} = (POSIX::floor(($self->getWidth()) / (2 ** (1))));
        $self->{halfHeight} = (POSIX::floor(($self->getHeight()) / (2 ** (1))));
        $self->{halfCellWidth} = (POSIX::floor(($cellWidth) / (2 ** (1))));
        $self->{halfCellHeight} = (POSIX::floor(($cellHeight) / (2 ** (1))));
    return $self;
}


sub setCells {
    my ($self, $mapTwoDArray) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Start: r: ");
        $stringBuffer->appendint(scalar(@{$mapTwoDArray}));
        $stringBuffer->append(" c: ");
        $stringBuffer->appendint(scalar(@{$mapTwoDArray->[0]}));
        $stringBuffer->append(" rows: ");
        $stringBuffer->appendint($self->getRows());
        $stringBuffer->append(" columns: ");
        $stringBuffer->appendint($self->getColumns());
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "setCells");
        my $rows = $self->getRows();
        my $columns = $self->getColumns();
        for (my $col = 0; $col < $columns; $col++) {
            for (my $row = 0; $row < $rows; $row++) {
                $self->setCell($col, $row, $mapTwoDArray->[$row]->[$col]);
            }
        }
}


sub updateCells {
    my ($self, $mapTwoDArray, $fromTileId, $toTileId) = @_;
        my $rows = $self->getRows();
        my $columns = $self->getColumns();
        for (my $col = 0; $col < $columns; $col++) {
            for (my $row = 0; $row < $rows; $row++) {
                if ($fromTileId == $mapTwoDArray->[$row]->[$col]) {
                    $mapTwoDArray->[$row]->[$col] = $toTileId;
                    $self->setCell($col, $row, $mapTwoDArray->[$row]->[$col]);
                }
            }
        }
}


sub getName {
    my ($self) = @_;
        return ref($self);
}


sub paint {
    my ($self, $graphics) = @_;
}


sub paintThreed {
    my ($self, $graphics) = @_;
}


sub getX2 {
    my ($self) = @_;
        return $self->{x} + $self->getWidth();
}


sub getY2 {
    my ($self) = @_;
        return $self->{y} + $self->getHeight();
}


sub getZ2 {
    my ($self) = @_;
        return int(($self->{z} + $self->getDepth()));
}


sub getCellWidth {
    my ($self) = @_;
        return $self->{cellWidth};
}


sub getCellHeight {
    my ($self) = @_;
        return $self->{cellHeight};
}


sub getCell {
    my ($self, $col, $row) = @_;
        return -1;
}


sub getColumns {
    my ($self) = @_;
        return -1;
}


sub getRows {
    my ($self) = @_;
        return -1;
}


sub setCell {
    my ($self, $col, $row, $tileIndex) = @_;
}


sub getHalfWidth {
    my ($self) = @_;
        return $self->{halfWidth};
}


sub getHalfHeight {
    my ($self) = @_;
        return $self->{halfHeight};
}


sub getDataId {
    my ($self) = @_;
        return $self->{dataId};
}


sub getHalfCellWidth {
    my ($self) = @_;
        return $self->{halfCellWidth};
}


sub getHalfCellHeight {
    my ($self) = @_;
        return $self->{halfCellHeight};
}


sub isOnTileLayer {
    my ($self, $column, $row) = @_;
        if ($self->getColumns() > $column && $self->getRows() > $row && $row >= 0 && $column >= 0) {
            return 1;
        } else {
            return 0;
        }
}


sub getAnimatedTile {
    my ($self, $animationTileIndex) = @_;
        return $animationTileIndex;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::layer::Layer;
use org::allbinary::layer::NamedInterface;
use org::allbinary::string::CommonStrings;

1;

