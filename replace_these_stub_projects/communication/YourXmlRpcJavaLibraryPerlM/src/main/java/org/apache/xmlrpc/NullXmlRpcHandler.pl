# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::apache::xmlrpc::NullXmlRpcHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::apache::xmlrpc::XmlRpcHandler';

tie our $NULL_XML_RPC_HANDLER, 'java::lang::LazyStatic', sub { 'org::apache::xmlrpc::NullXmlRpcHandler'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub execute {
    my ($self, $method, $params) = @_;
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::logic::NullUtil ();
use org::apache::xmlrpc::XmlRpcHandler ();

1;

