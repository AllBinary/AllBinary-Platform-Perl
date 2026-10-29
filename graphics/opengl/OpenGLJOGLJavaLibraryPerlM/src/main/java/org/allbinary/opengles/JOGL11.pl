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

#JOGLEToKhronosGL11
package org::allbinary::opengles::JOGL11;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::opengles::JOGL10','javax::microedition::khronos::opengles::GL11';


sub _init_fields {
    my ($self) = @_;
    $self->{gl11} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of JOGL11 takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $gl) = @_;
    my $self = $class->_new2($gl, $gl);
        # this(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $gl, $gl2) = @_;
    my $self = $class->SUPER::new($gl, $gl2);
    $self->_init_fields();
        # super(...) made $self above
        $self->{gl11} = $self->getJOGLGL();
    return $self;
}


sub glBindBuffer {
    my ($self, $target, $buffer) = @_;
        $self->{gl11}->glBindBuffer($target, $buffer);
}


sub glBufferData {
    my ($self, $target, $size, $data, $usage) = @_;
        $self->{gl11}->glBufferData($target, $size, $data, $usage);
}


sub glBufferSubData {
    my ($self, $target, $offset, $size, $data) = @_;
        $self->{gl11}->glBufferSubData($target, $offset, $size, $data);
}


sub glClipPlanef {
    my ($self, $plane, $equation, $offset) = @_;
        $self->{gl11}->glClipPlanef($plane, $equation, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glClipPlanef {
    my ($self, $plane, $equation) = @_;
        $self->{gl11}->glClipPlanef($plane, $equation);
}


sub glColor4ub {
    my ($self, $red, $green, $blue, $alpha) = @_;
        $self->{gl11}->glColor4ub($red, $green, $blue, $alpha);
}


sub glColorPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
        $self->{gl11}->glColorPointer($size, $type, $stride, $offset);
}


sub glDeleteBuffers {
    my ($self, $n, $buffers, $offset) = @_;
        $self->{gl11}->glDeleteBuffers($n, $buffers, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glDeleteBuffers {
    my ($self, $n, $buffers) = @_;
        $self->{gl11}->glDeleteBuffers($n, $buffers);
}


sub glDrawElements {
    my ($self, $mode, $count, $type, $offset) = @_;
        $self->{gl11}->glDrawElements($mode, $count, $type, $offset);
}


sub glGenBuffers {
    my ($self, $n, $buffers, $offset) = @_;
        $self->{gl11}->glGenBuffers($n, $buffers, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGenBuffers {
    my ($self, $n, $buffers) = @_;
        $self->{gl11}->glGenBuffers($n, $buffers);
}


sub glGetBufferParameteriv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetBufferParameteriv($target, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetBufferParameteriv {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glGetBufferParameteriv($target, $pname, $params);
}


sub glGetClipPlanef {
    my ($self, $pname, $eqn, $offset) = @_;
        $self->{gl11}->glGetClipPlanef($pname, $eqn, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetClipPlanef {
    my ($self, $pname, $eqn) = @_;
        $self->{gl11}->glGetClipPlanef($pname, $eqn);
}


sub glGetFloatv {
    my ($self, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetFloatv($pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetFloatv {
    my ($self, $pname, $params) = @_;
        $self->{gl11}->glGetFloatv($pname, $params);
}


sub glGetLightfv {
    my ($self, $light, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetLightfv($light, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetLightfv {
    my ($self, $light, $pname, $params) = @_;
        $self->{gl11}->glGetLightfv($light, $pname, $params);
}


sub glGetMaterialfv {
    my ($self, $face, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetMaterialfv($face, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetMaterialfv {
    my ($self, $face, $pname, $params) = @_;
        $self->{gl11}->glGetMaterialfv($face, $pname, $params);
}


sub glGetTexEnviv {
    my ($self, $env, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetTexEnviv($env, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetTexEnviv {
    my ($self, $env, $pname, $params) = @_;
        $self->{gl11}->glGetTexEnviv($env, $pname, $params);
}


sub glGetTexParameterfv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetTexParameterfv($target, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetTexParameterfv {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glGetTexParameterfv($target, $pname, $params);
}


sub glGetTexParameteriv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glGetTexParameteriv($target, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glGetTexParameteriv {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glGetTexParameteriv($target, $pname, $params);
}


sub glIsBuffer {
    my ($self, $buffer) = @_;
        return $self->{gl11}->glIsBuffer($buffer);
}


sub glIsEnabled {
    my ($self, $cap) = @_;
        return $self->{gl11}->glIsEnabled($cap);
}


sub glIsTexture {
    my ($self, $texture) = @_;
        return $self->{gl11}->glIsTexture($texture);
}


sub glNormalPointer {
    my ($self, $type, $stride, $offset) = @_;
        $self->{gl11}->glNormalPointer($type, $stride, $offset);
}


sub glPointParameterf {
    my ($self, $pname, $param) = @_;
        $self->{gl11}->glPointParameterf($pname, $param);
}


sub glPointParameterfv {
    my ($self, $pname, $params, $offset) = @_;
        $self->{gl11}->glPointParameterfv($pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glPointParameterfv {
    my ($self, $pname, $params) = @_;
        $self->{gl11}->glPointParameterfv($pname, $params);
}


sub glTexCoordPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
        $self->{gl11}->glTexCoordPointer($size, $type, $stride, $offset);
}


sub glTexEnvi {
    my ($self, $target, $pname, $param) = @_;
        $self->{gl11}->glTexEnvi($target, $pname, $param);
}


sub glTexEnviv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glTexEnviv($target, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glTexEnviv {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glTexEnviv($target, $pname, $params);
}


sub glTexParameterfv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glTexParameterfv($target, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glTexParameterfv {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glTexParameterfv($target, $pname, $params);
}


sub glTexParameteri {
    my ($self, $target, $pname, $param) = @_;
        $self->{gl11}->glTexParameteri($target, $pname, $param);
}


sub glTexParameteriv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glTexParameteriv($target, $pname, $params, $offset);
}


# Java overloaded method: Perl keeps the last definition
sub glTexParameteriv {
    my ($self, $target, $pname, $params) = @_;
        $self->{gl11}->glTexParameteriv($target, $pname, $params);
}


sub glTexParameterxv {
    my ($self, $target, $pname, $params, $offset) = @_;
        $self->{gl11}->glTexParameteriv($target, $pname, $params, $offset);
}


sub glVertexPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
        $self->{gl11}->glVertexPointer($size, $type, $stride, $offset);
}

use com::jogamp::opengl::GL;
use com::jogamp::opengl::GL2;

1;

