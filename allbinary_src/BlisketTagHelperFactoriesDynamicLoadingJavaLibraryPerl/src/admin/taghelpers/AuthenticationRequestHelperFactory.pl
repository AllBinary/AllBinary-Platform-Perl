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

package admin::taghelpers::AuthenticationRequestHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','admin::taghelpers::TagHelperFactoryInterface';

our $CLASSNAME = "admin.taghelpers.AuthenticationRequestHelper";
our $FACTORYNAME = "AuthenticationRequestHelperFactory";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws LicensingException
sub getInstance_j2_1 {
    my ($self, $hashMap, $pageContext) = @_;
        return java::lang::Object::jstatic('admin::taghelpers::AuthenticationRequestHelperFactory', 'HelperFactory')->getInstance($admin::taghelpers::AuthenticationRequestHelperFactory::FACTORYNAME, $admin::taghelpers::AuthenticationRequestHelperFactory::CLASSNAME, $hashMap, $pageContext);
}


# throws LicensingException
sub getInstance_j2_2 {
    my ($self, $hashMap, $httpServletRequest) = @_;
        return java::lang::Object::jstatic('admin::taghelpers::AuthenticationRequestHelperFactory', 'HelperFactory')->getInstance($admin::taghelpers::AuthenticationRequestHelperFactory::FACTORYNAME, $admin::taghelpers::AuthenticationRequestHelperFactory::CLASSNAME, $hashMap, $httpServletRequest);
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

sub getInstance_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j2_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->getInstance_j2_2(@arguments);
}

use java::lang::Object ();
use java::util::HashMap ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::logic::system::security::licensing::LicensingException ();
# use javax::servlet::http::HttpServletRequest ();

1;

