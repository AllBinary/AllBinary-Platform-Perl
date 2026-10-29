# 
# To change this license header, choose License Headers in Project Properties. 
# To change this template file, choose Tools | Templates 
# and open the template in the editor.  
# Generated Code Do Not Modify

package org::allbinary::input::motion::button::TouchButtonResource;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{RESOURCE} = undef;
    $self->{HINT} = undef;
}


sub new {
    my ($class, $resource, $hint) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{RESOURCE} = $resource;
        $self->{HINT} = $hint;
    return $self;
}


1;

