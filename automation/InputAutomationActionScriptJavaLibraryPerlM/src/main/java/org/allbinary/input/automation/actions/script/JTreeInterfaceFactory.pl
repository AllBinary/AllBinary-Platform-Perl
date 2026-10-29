# 
# To change this license header, choose License Headers in Project Properties. 
# To change this template file, choose Tools | Templates 
# and open the template in the editor.  
# Generated Code Do Not Modify

package org::allbinary::input::automation::actions::script::JTreeInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::input::automation::actions::script::JTreeInterfaceFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{jTreeInterface} = undef;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::automation::actions::script::JTreeInterfaceFactory::instance;
}


sub set {
    my ($self, $jTreeInterface) = @_;
        $self->{jTreeInterface} = $jTreeInterface;
}


sub getJTreeInterface {
    my ($self) = @_;
        return $self->{jTreeInterface};
}


1;

