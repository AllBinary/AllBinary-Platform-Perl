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

package org::allbinary::servlet::BlisketServletUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::servlet::BlisketServletUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::servlet::BlisketServletUtil::instance;
}


sub init {
    my ($self, $request) = @_;
        my $urlGlobals = 'org::allbinary::globals::AppUrlGlobals'->new();
        $urlGlobals->setWebappPath($request->getServletContext()->getRealPath('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR}));
        'org::allbinary::globals::URLGLOBALS'->init($urlGlobals);
        'org::allbinary::logic::system::loader::WebappClassLoaderInfo'->setLoader(ref($self)->getClassLoader());
}

# use javax::servlet::http::HttpServletRequest;
use org::allbinary::globals::AppUrlGlobals;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::system::loader::WebappClassLoaderInfo;

1;

