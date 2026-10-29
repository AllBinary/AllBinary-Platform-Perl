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



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($class) = @_;
        return 'org::allbinary::business::user::modules::User'->new();
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $transformInfoInterface) = @_;
        my $httpTransformInfoInterface = $transformInfoInterface;
        my $httpServletRequest = $httpTransformInfoInterface->getPageContext()->getRequest();
        my $hashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($httpServletRequest)->toHashMap();
        my $role = $httpTransformInfoInterface->getPropertiesHashMap()->get($org::allbinary::business::user::role::UserRoleData::NAME->toString());
        $hashMap->put($org::allbinary::business::user::role::UserRoleData::NAME->toString(), $role);
        return 'org::allbinary::business::user::CreateUserFactory'->getInstance($hashMap);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $httpServletRequest, $propertiesHashMap) = @_;
        if (defined($propertiesHashMap)) {
            my $requestHashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($httpServletRequest)->toHashMap();
            my $roleString = $propertiesHashMap->get($org::allbinary::business::user::role::UserRoleData::NAME->toString());
            $requestHashMap->put($org::allbinary::business::user::role::UserRoleData::NAME->toString(), $roleString);
            return 'org::allbinary::business::user::CreateUserFactory'->getInstance($requestHashMap);
        } else {
            die ("Null HashMap");
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::modules::User;
use org::allbinary::business::user::role::UserRoleData;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::business::user::CreateUserFactory;

1;

