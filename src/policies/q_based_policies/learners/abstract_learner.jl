export AbstractLearner

using Flux

"""
    (learner::AbstractLearner)(env)

A learner is usually used to estimate state values, state-action values or distributional values based on experiences.
"""
abstract type AbstractLearner end

function (learner::AbstractLearner)(env) end

"""
    get_priority(p::AbstractLearner, experience)
"""
function RLBase.get_priority(p::AbstractLearner, experience) end

Base.show(io::IO, p::AbstractLearner) =
    AbstractTrees.print_tree(io, StructTree(p), get(io, :max_depth, 10))
