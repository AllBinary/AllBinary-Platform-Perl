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

package org::allbinary::business::user::NewUserFactory;
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
sub getInstance_j0 {
    my ($class) = @_;
        return 'org::allbinary::business::user::modules::User'->new();
}


# throws Exception
sub getInstance_j1 {
    my ($class, $transformInfoInterface) = @_;
        my $httpTransformInfoInterface = $transformInfoInterface;
        my $httpServletRequest = $httpTransformInfoInterface->getPageContext()->getRequest();
        my $hashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($httpServletRequest)->toHashMap();
        my $role = $httpTransformInfoInterface->getPropertiesHashMap()->get($org::allbinary::business::user::role::UserRoleData::NAME->toString());
        $hashMap->put($org::allbinary::business::user::role::UserRoleData::NAME->toString(), $role);
        return java::lang::Object::jstatic('org::allbinary::business::user::NewUserFactory', 'CreateUserFactory')->getInstance($hashMap);
}


# throws Exception
sub getInstance_j2 {
    my ($class, $httpServletRequest, $propertiesHashMap) = @_;
        if (defined($propertiesHashMap)) {
            my $requestHashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($httpServletRequest)->toHashMap();
            my $roleString = $propertiesHashMap->get($org::allbinary::business::user::role::UserRoleData::NAME->toString());
            $requestHashMap->put($org::allbinary::business::user::role::UserRoleData::NAME->toString(), $roleString);
            return java::lang::Object::jstatic('org::allbinary::business::user::NewUserFactory', 'CreateUserFactory')->getInstance($requestHashMap);
        } else {
            die ("Null HashMap");
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->getInstance_j2(@arguments) if scalar(@arguments) == 2;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::util::HashMap ();
# use javax::servlet::http::HttpServletRequest ();
use org::allbinary::business::user::modules::User ();
use org::allbinary::business::user::role::UserRoleData ();
use org::allbinary::logic::communication::http::request::RequestParams ();
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();

1;

