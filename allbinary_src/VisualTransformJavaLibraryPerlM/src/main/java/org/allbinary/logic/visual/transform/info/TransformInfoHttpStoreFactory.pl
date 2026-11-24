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

package org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::logic::visual::transform::info::TransformInfoFactoryInterface';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreFactory'->new() };


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance_j3 {
    my ($self, $databaseHashMap, $propertiesHashMap, $pageContext) = @_;
        return 'org::allbinary::logic::visual::transform::info::TransformInfoHttpStore'->new($databaseHashMap, $propertiesHashMap, $pageContext);
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j3(@arguments) if scalar(@arguments) == 3;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use java::util::HashMap ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::logic::visual::transform::info::TransformInfoHttpStore ();

1;

