# distutils: language = c++
#-----------------------------------------------------------------------------
# Copyright (c) 2016, PyStan developers
#
# This file is licensed under the terms of the Mozilla Public License, v. 2.0.
# See LICENSE for a text of the license.
#-----------------------------------------------------------------------------

from libcpp.string cimport string
from libcpp.vector cimport vector


# Cython does not package support for iostream, this is a workaround
cdef extern from "<iostream>" namespace "std":
    cdef cppclass ostream:
        pass
    cdef ostream cout

cdef extern from "stan/interface_callbacks/writer/base_writer.hpp" namespace "stan::interface_callbacks::writer":
    cdef cppclass base_writer:
        pass

cdef extern from "stan/interface_callbacks/writer/stream_writer.hpp" namespace "stan::interface_callbacks::writer":
    cdef cppclass stream_writer:
        stream_writer(ostream& output)
        stream_writer(ostream& output, string& key_value_prefix)
        void operator()(string& key, double value)
        void operator()(string& key, int value)
        void operator()(string& key, string& value)
        void operator()(string& key, double* values, int n_values)
        void operator()(string& key, double* values, int n_rows, int n_cols)
        void operator()(vector[string]& names)
        void operator()(vector[double]& state)
        void operator()()
        void operator()(string& message)
