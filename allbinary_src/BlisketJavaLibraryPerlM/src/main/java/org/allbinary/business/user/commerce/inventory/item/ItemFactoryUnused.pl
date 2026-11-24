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

package org::allbinary::business::user::commerce::inventory::item::ItemFactoryUnused;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws MoneyException
sub getInstance_j1_1 {
    my ($class, $hashMap) = @_;
        return 'org::allbinary::business::user::commerce::inventory::item::Item'->new($hashMap);
}


# throws Exception, MoneyException
sub getInstance_j1_2 {
    my ($class, $request) = @_;
        return 'org::allbinary::business::user::commerce::inventory::item::Item'->new('org::allbinary::logic::communication::http::request::RequestParams'->new($request)->toHashMap());
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->getInstance_j1_2(@arguments);
}

use java::lang::Object ();
use java::util::HashMap ();
# use javax::servlet::http::HttpServletRequest ();
use org::allbinary::business::user::commerce::money::MoneyException ();
use org::allbinary::data::tables::TableMappingInterface ();
use org::allbinary::logic::communication::http::request::RequestParams ();

1;

