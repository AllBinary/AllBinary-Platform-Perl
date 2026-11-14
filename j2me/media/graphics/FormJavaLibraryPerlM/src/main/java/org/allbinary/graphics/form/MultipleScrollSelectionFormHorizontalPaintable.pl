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

package org::allbinary::graphics::form::MultipleScrollSelectionFormHorizontalPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::ItemIndexPaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{multipleScrollSelectionForm} = undef;
}


sub new {
    my ($class, $multipleScrollSelectionForm) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{multipleScrollSelectionForm} = $multipleScrollSelectionForm;
    return $self;
}


# throws Exception
sub paint {
    my ($self, $graphics, $index, $item, $dx, $dy) = @_;
        return $self->{multipleScrollSelectionForm}->paintHorizontal($graphics, $index, $item, $dx, $dy);
}

use java::lang::Object ();
use javax::microedition::lcdui::Graphics ();
use org::allbinary::graphics::form::item::ABCustomItem ();
use org::allbinary::graphics::form::ItemIndexPaintable ();

1;

