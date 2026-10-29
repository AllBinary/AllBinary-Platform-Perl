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

package org::allbinary::graphics::CellPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::graphics::CellPositionFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{NONE} = 'org::allbinary::graphics::CellPosition'->new(-1, -1, -1, -1);
    $self->{cellPositionArray} = [map { [(undef) x (0)] } 1 .. (0)];
    $self->{columns} = 0;
    $self->{rows} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::CellPositionFactory::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self, $columns, $rows) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Init: columns: ");
        $stringBuffer->appendint($columns);
        $stringBuffer->append(" rows: ");
        $stringBuffer->appendint($rows);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $commonStrings->{INIT});
        $self->{cellPositionArray} = [map { [(undef) x ($rows)] } 1 .. ($columns)];
        $self->{columns} = $columns;
        $self->{rows} = $rows;
        for (my $column = 0; $column < $columns; $column++) {
            for (my $row = 0; $row < $rows; $row++) {
                $self->createInstance($column, $row);
            }
        }
}


sub getInstanceColRow {
    my ($self, $i_column, $i_row) = @_;
        try {
            return $self->{cellPositionArray}->[$i_column]->[$i_row];
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put('org::allbinary::logic::string::StringMaker'->new()->append("columns: ")->appendint($self->getColumns())->append(" rows: ")->appendint($self->getRows())->append(" col: ")->appendint($i_column)->append(" row: ")->appendint($i_row)->toString(), $self, $commonStrings->{GET_INSTANCE}, $e);
            return $self->{NONE};
        }
}


sub createInstance {
    my ($self, $i_column, $i_row) = @_;
        my $cellPositionCanBeNull = $self->{cellPositionArray}->[$i_column]->[$i_row];
        if (!defined($cellPositionCanBeNull)) {
            $cellPositionCanBeNull = 'org::allbinary::graphics::CellPosition'->new($i_column, $i_row, $self->{columns}, $self->{rows});
            $self->{cellPositionArray}->[$i_column]->[$i_row] = $cellPositionCanBeNull;
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
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::graphics::CellPosition;

1;

