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

package admin::taghelpers::TagHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelperFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception, LicensingException
sub getInstance {
    my ($self, $hashMap, $pageContext) = @_;
        die ("RuntimeException");
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::string::CommonStrings;
use admin::taghelpers::TagHelperFactoryInterface;

1;

