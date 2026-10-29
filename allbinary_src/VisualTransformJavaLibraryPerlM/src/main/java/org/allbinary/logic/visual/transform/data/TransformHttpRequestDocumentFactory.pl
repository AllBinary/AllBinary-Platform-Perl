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

package org::allbinary::logic::visual::transform::data::TransformHttpRequestDocumentFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $pageContext, $weblisketSession) = @_;
        return 'org::allbinary::logic::visual::transform::data::TransformHttpRequestDocument'->new($pageContext, $weblisketSession);
}

# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::visual::transform::data::TransformHttpRequestDocument;

1;

