# Generated Code Do Not Modify

package org::allbinary::game::layer::drop::PlacedLayerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::drop::PlacedLayerFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub clear {
    my ($self) = @_;
        $self->{list}->clear();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::drop::PlacedLayerFactory::instance;
}


sub getSize {
    my ($self) = @_;
        return $self->{list}->size();
}


sub getRandomInstance {
    my ($self) = @_;
        return $self->{basicArrayListUtil}->getRandom($self->{list});
}


sub add {
    my ($self, $layerInterfaceFactoryInterface) = @_;
        $self->{list}->add($layerInterfaceFactoryInterface);
}

use org::allbinary::layer::AllBinaryLayerFactoryInterface;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;

1;

