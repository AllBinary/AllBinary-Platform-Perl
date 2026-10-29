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

package org::allbinary::media::audio::BaseSoundsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::audio::SoundsFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{initialized} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
}


# throws Exception
sub getSoundInterfaceArray {
    my ($self) = @_;
        return [(undef) x (0)];
}


sub setInitialized {
    my ($self, $initialized) = @_;
        $self->{initialized} = $initialized;
}


sub isInitialized {
    my ($self) = @_;
        return $self->{initialized};
}

use org::allbinary::media::audio::SoundsFactoryInterface;

1;

