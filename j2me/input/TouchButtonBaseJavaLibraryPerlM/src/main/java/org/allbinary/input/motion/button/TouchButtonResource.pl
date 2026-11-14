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
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{RESOURCE} = undef;
    $self->{HINT} = undef;
}


sub new {
    my ($class, $resource, $hint) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{RESOURCE} = $resource;
        $self->{HINT} = $hint;
    return $self;
}

use java::lang::Object ();

1;

