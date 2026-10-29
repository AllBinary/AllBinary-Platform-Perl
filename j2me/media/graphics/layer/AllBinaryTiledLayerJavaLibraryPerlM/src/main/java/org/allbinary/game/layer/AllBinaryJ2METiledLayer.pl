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

package org::allbinary::game::layer::AllBinaryJ2METiledLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::AllBinaryTiledLayer';


sub _init_fields {
    my ($self) = @_;
    $self->{tiledLayerP} = undef;
    $self->{debugColor} = undef;
    $self->{font2} = 'javax::microedition::lcdui::Font'->getFont($javax::microedition::lcdui::Font::FACE_SYSTEM, $javax::microedition::lcdui::Font::STYLE_PLAIN, 4);
}


sub new {
    my ($class, $dataId, $tiledLayer, $mapTwoDArray, $debugColor) = @_;
    my $self = $class->SUPER::new($dataId, $tiledLayer->getWidth(), $tiledLayer->getHeight(), $tiledLayer->getCellWidth(), $tiledLayer->getCellHeight());
    $self->_init_fields();
        # super(...) made $self above
        $self->{tiledLayerP} = $tiledLayer;
        $self->{debugColor} = $debugColor;
        $self->setCells($mapTwoDArray);
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{tiledLayerP}->paint($graphics);
}


sub paintDebug {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $graphics->setFont($self->{font2});
        $graphics->setColor($self->{debugColor});
        my $x = $self->{tiledLayerP}->getX();
        my $y = $self->{tiledLayerP}->getY();
        my $firstColumn = 0;
        my $firstRow = 0;
        my $totalColumns = $self->{tiledLayerP}->getColumns();
        my $totalRows = $self->{tiledLayerP}->getRows();
        my $x0 = $x;
        my $tile = 0;
        my $tileHeight = $self->{tiledLayerP}->getCellHeight();
        my $tileWidth = $self->{tiledLayerP}->getCellWidth();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $rowIndex = $firstRow; $rowIndex < $totalRows; $rowIndex++, $y += $tileHeight) {
            $x = $x0;
            for (my $columnIndex = $firstColumn; $columnIndex < $totalColumns; $columnIndex++, $x += $tileWidth) {
                $tile = $self->{tiledLayerP}->getCell($columnIndex, $rowIndex);
                if ($tile < 0) {
                    $tile = $self->{tiledLayerP}->getAnimatedTile($tile);
                }
                if ($tile == 0) {
                    next;
                }
                $tile--;
                $stringMaker->delete(0, $stringMaker->length());
                $graphics->drawString($stringMaker->appendint($columnIndex)->append($commonSeps->{COMMA})->appendint($rowIndex)->append($commonSeps->{COLON})->appendint($tile)->toString(), $x + 5, $y + 10, 0);
            }
        }
        $graphics->setFont($font);
}


sub moveDXY {
    my ($self, $dx, $dy) = @_;
        $self->{tiledLayerP}->move($dx, $dy);
        $self->SUPER::moveDXY(-$dx, -$dy);
}


sub setPosition {
    my ($self, $x, $y, $z) = @_;
        $self->{tiledLayerP}->setPosition($x, $y);
        $self->SUPER::setPosition(-$x, -$y, $z);
}


sub getTiledLayer {
    my ($self) = @_;
        return $self->{tiledLayerP};
}


sub getCellWidth {
    my ($self) = @_;
        return $self->{tiledLayerP}->getCellWidth();
}


sub getCellHeight {
    my ($self) = @_;
        return $self->{tiledLayerP}->getCellHeight();
}


sub getCell {
    my ($self, $col, $row) = @_;
        return $self->{tiledLayerP}->getCell($col, $row);
}


sub getColumns {
    my ($self) = @_;
        return $self->{tiledLayerP}->getColumns();
}


sub getRows {
    my ($self) = @_;
        return $self->{tiledLayerP}->getRows();
}


sub setCell {
    my ($self, $col, $row, $index) = @_;
        $self->{tiledLayerP}->setCell($col, $row, $index);
}


sub getAnimatedTile {
    my ($self, $animationTileIndex) = @_;
        return $self->{tiledLayerP}->getAnimatedTile($animationTileIndex);
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::game::TiledLayer;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::game::layer::AllBinaryTiledLayer;

1;

