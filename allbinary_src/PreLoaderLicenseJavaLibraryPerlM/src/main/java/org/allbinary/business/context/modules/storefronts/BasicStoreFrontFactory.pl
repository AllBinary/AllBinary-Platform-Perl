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

package org::allbinary::business::context::modules::storefronts::BasicStoreFrontFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::business::context::modules::storefronts::BasicStoreFrontFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::business::context::modules::storefronts::BasicStoreFrontFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j1 {
    my ($self, $storeName) = @_;
        try {
            my $storeFronts = 'org::allbinary::business::context::modules::storefronts::BasicStoreFrontsEntity'->new();
            return $storeFronts->getStoreFrontInterface($storeName);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{FACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use org::allbinary::business::context::modules::storefronts::BasicStoreFrontsEntity ();

1;

