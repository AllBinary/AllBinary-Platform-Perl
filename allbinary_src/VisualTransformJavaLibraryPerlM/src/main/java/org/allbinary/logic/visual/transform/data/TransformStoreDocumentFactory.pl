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

package org::allbinary::logic::visual::transform::data::TransformStoreDocumentFactory;
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


# throws Exception
sub getInstance_j2 {
    my ($class, $pageContext, $weblisketSession) = @_;
        return 'org::allbinary::logic::visual::transform::data::TransformStoreDocument'->new($pageContext, $weblisketSession);
}


# throws Exception
sub getInstance_j1 {
    my ($class, $searchRequest) = @_;
        return 'org::allbinary::logic::visual::transform::data::TransformStoreDocument'->new($searchRequest);
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::logic::communication::http::request::session::WeblisketSession ();
use org::allbinary::logic::control::search::SearchRequest ();
use org::allbinary::logic::visual::transform::data::TransformStoreDocument ();

1;

