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

package org::allbinary::game::displayable::canvas::PreGameLockableFormPaintableFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::ItemPaintableFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{lockedIndex} = undef;
}


sub new {
    my ($class, $lockedIndex) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{lockedIndex} = $lockedIndex;
    return $self;
}


# throws Exception
sub getInstanceItemPaintable {
    my ($self, $paintableForm) = @_;
        return 'org::allbinary::game::displayable::canvas::PreGameLockablePaintable'->new($paintableForm, $self->{lockedIndex});
}

use org::allbinary::graphics::form::ItemPaintable;
use org::allbinary::graphics::form::ItemPaintableFactory;
use org::allbinary::graphics::form::PaintableForm;
use org::allbinary::graphics::form::ScrollCurrentSelectionForm;
use org::allbinary::game::displayable::canvas::PreGameLockablePaintable;

1;

