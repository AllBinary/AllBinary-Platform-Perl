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



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws MoneyException
sub getInstance {
    my ($class, $hashMap) = @_;
        return 'org::allbinary::business::user::commerce::inventory::item::Item'->new($hashMap);
}


# throws Exception, MoneyException
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $request) = @_;
        return 'org::allbinary::business::user::commerce::inventory::item::Item'->new('org::allbinary::logic::communication::http::request::RequestParams'->new($request)->toHashMap());
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::business::user::commerce::inventory::item::Item;

1;

