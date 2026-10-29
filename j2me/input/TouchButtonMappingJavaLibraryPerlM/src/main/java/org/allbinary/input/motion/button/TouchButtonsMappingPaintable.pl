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

package org::allbinary::input::motion::button::TouchButtonsMappingPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{foregroundColor} = undef;
    $self->{paintableTable} = [map { [(undef) x (0)] } 1 .. (0)];
    $self->{touchButtonLocationHelper} = 'org::allbinary::input::motion::button::TouchButtonLocationHelper'->new();
}


sub new {
    my ($class, $basicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{foregroundColor} = int($basicColor);
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
        try {
            $self->{paintableTable} = $self->createPaintableTable();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "updateRectangle", $e);
        }
}


# throws Exception
sub createPaintableTable {
    my ($self) = @_;
        my $totalColumns = $self->{touchButtonLocationHelper}->getTotalColumns();
        my $totalRows = $self->{touchButtonLocationHelper}->getTotalRows();
        my $paintableTable = [map { [(undef) x ($totalRows)] } 1 .. ($totalColumns)];
        my $cellPositionFactory = 'org::allbinary::graphics::CellPositionFactory'->getInstance();
        my $commonButtons = 'org::allbinary::input::motion::button::CommonButtons'->getInstance();
        for (my $index = $totalColumns - 1; $index >= 0; $index--) {
            for (my $rowIndex = $totalRows - 1; $rowIndex >= 0; $rowIndex--) {
                $self->{paintableTable}->[$index]->[$rowIndex] = 'org::allbinary::input::motion::button::TouchButton'->createButton('org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance()->{NONE}, 'org::allbinary::input::motion::button::TouchButtonBlankResource'->getInstance(), $commonButtons->{NORMAL_BUTTON}, $cellPositionFactory->getInstanceColRow($index, $rowIndex), $self->{touchButtonLocationHelper}->getColumnsRemainderHalf(), $self->{touchButtonLocationHelper}->getRowsRemainderHalf());
            }
        }
        return $paintableTable;
}


sub paint {
    my ($self, $graphics) = @_;
        my $totalColumns = $self->{touchButtonLocationHelper}->getTotalColumns();
        my $totalRows = $self->{touchButtonLocationHelper}->getTotalRows();
        for (my $index = $totalColumns - 1; $index >= 0; $index--) {
            for (my $rowIndex = $totalRows - 1; $rowIndex >= 0; $rowIndex--) {
                $self->{paintableTable}->[$index]->[$rowIndex]->paint($graphics);
            }
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::CellPositionFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::motion::button::TouchButtonLocationHelper;
use org::allbinary::input::motion::button::CommonButtons;
use org::allbinary::input::motion::button::TouchButton;
use org::allbinary::input::motion::button::BasicTouchInputFactory;
use org::allbinary::input::motion::button::TouchButtonBlankResource;

1;

