# Generated Code Do Not Modify

package org::allbinary::AndroidResources;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::AndroidResources'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{drawable} = 'R::drawable'->new();
    $self->{id} = 'R::id'->new();
    $self->{layout} = 'R::layout'->new();
    $self->{raw} = 'R::raw'->new();
    $self->{string} = 'R::string'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::AndroidResources::instance;
}

use org::allbinary::game::testgamedemo::R;

1;

