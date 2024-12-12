import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head, Link, router, useForm } from '@inertiajs/react';
import { Card, CardBody } from '@material-tailwind/react';
import { useEffect } from 'react';

export default function CreateOrder({ auth, order, readonly }) {
    const { data, setData, post, put, errors, reset } = useForm({
        name: '',
        contact: '',
        company_name: '',
        description: '',
        size: '',
        weight: '',
        status: '',
        pickup_name: '',
        pickup_address: '',
        pickup_city: '',
        pickup_postal_code: '',
        pickup_contact: '',
        pickup_datetime: '',
        destination_name: '',
        destination_address: '',
        destination_city: '',
        destination_postal_code: '',
        destination_contact: '',
        destination_datetime: ''
    })

    useEffect(() => {
        if(order) setData(order);
    }, []);

    function saveOrder(event) {
        event.preventDefault();
        if(!order) post(route('orders.store'));
        else put(route('orders.update', { order }));
    }

    function handleInput(e) {
        const input = e.target.name;
        const value = e.target.value;
        setData(input, value);
    }

    function resetForm() { reset() }

    function showPageTitle(){
        if(!readonly && order) return 'Edit Order' + ' #' + order.id;
        if(!readonly && !order) return 'Create Order';
        if(readonly && order) return 'Order' + ' #' + order.id;
    }

    return (
        <AuthenticatedLayout
            user={auth.user}
            header={
                <div className='flex justify-between items-center'>
                    <h2 className="text-xl font-semibold leading-tight text-gray-800">
                        { showPageTitle() }
                    </h2>
                    {/* <Link href={route('orders.create')} className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded'>Save</Link> */}
                </div>
            }
        >
            <Head title="Orders" />

            <div className="py-12">
                <div className="mx-auto max-w-4xl sm:px-6 lg:px-8">
                    {
                        errors && Object.keys(errors).length > 0 && (
                            <div className='bg-red-700 rounded p-4 text-white mb-4'>
                                <span className='font-bold text-lg'>Error submit the order!</span>
                                { Object.values(errors).map(error=> <p className='pl-3'>*{error}</p>) }
                            </div>
                        )
                    }
                    <Card>
                        <CardBody>
                            <form onSubmit={saveOrder}>
                                <div className="grid grid-cols gap-4">
                                    <div className="grid grid-cols-1">
                                        Name
                                        <input className='input' type="text" readOnly={readonly} name='name' value={data.name} onInput={handleInput} />
                                    </div>
                                    {/* <div className="grid grid-cols-1">
                                        Last Name
                                        <input className='input' type="text" name='last_name' value={data.last_name} onInput={handleInput} />
                                    </div> */}
                                </div>
                                <div className="grid grid-cols-2 gap-4">
                                    <div className="grid grid-cols-1">
                                        Contact
                                        <input className='input' type="text" readOnly={readonly} name='contact' value={data.contact} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Company Name (Optional)
                                        <input className='input' type="text" readOnly={readonly} name='company_name' value={data.company_name} onInput={handleInput} />
                                    </div>
                                </div>
                                <div className="grid grid-cols gap-4">
                                    <div className="grid grid-cols-1">
                                        Description
                                        <textarea className='input' name='description' readOnly={readonly} value={data.description} onInput={handleInput}></textarea>
                                    </div>
                                </div>
                                <div className="grid grid-cols gap-4">
                                    <div className="grid grid-cols-1">
                                        Size
                                        <textarea className='input' name='size' readOnly={readonly} value={data.size} onInput={handleInput}></textarea>
                                    </div>
                                </div>
                                <div className="grid grid-cols-2 gap-4">
                                    <div className="grid grid-cols-1">
                                        Weight
                                        <input className='input' type="text" readOnly={readonly} name='weight' value={data.weight} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Status
                                        <select className='input' name='status' readOnly={readonly} value={data.status} onChange={handleInput}>
                                            <option value="">Select Order Status</option>
                                            <option value="pending">Pending</option>
                                            <option value="in_progress">In Progress</option>
                                            <option value="delivered">Delivered</option>
                                        </select>
                                    </div>
                                </div>
                                <div className="grid grid-cols-1 font-bold mt-4">Pickup Details</div>
                                <div className="grid grid-cols-3 gap-4">
                                    <div className="grid grid-cols-1">
                                        Name
                                        <input className='input' type="text" readOnly={readonly} name='pickup_name' value={data.pickup_name} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Contact
                                        <input className='input' type="text" readOnly={readonly} name='pickup_contact' value={data.pickup_contact} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Date and Time
                                        <input className='input' type="date" readOnly={readonly} name='pickup_datetime' value={data.pickup_datetime} onChange={handleInput} />
                                    </div>
                                </div>
                                <div className="grid grid-cols-1">
                                    Street Address
                                    <input className='input' type="text" readOnly={readonly} name='pickup_address' value={data.pickup_address} onInput={handleInput} />
                                </div>
                                <div className="grid grid-cols-2 gap-4">
                                    <div className="grid grid-cols-1">
                                        City
                                        <input className='input' type="text" readOnly={readonly} name='pickup_city' value={data.pickup_city} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Postal Code
                                        <input className='input' type="text" readOnly={readonly} name='pickup_postal_code' value={data.pickup_postal_code} onInput={handleInput} />
                                    </div>
                                </div>
                                <div className="grid grid-cols-1 font-bold mt-4">Destination Details</div>
                                <div className="grid grid-cols-3 gap-4">
                                    <div className="grid grid-cols-1">
                                        Name
                                        <input className='input' type="text" readOnly={readonly} name='destination_name' value={data.destination_name} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Contact
                                        <input className='input' type="text" readOnly={readonly} name='destination_contact' value={data.destination_contact} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Date and Time
                                        <input className='input' type="date" readOnly={readonly} name='destination_datetime' value={data.destination_datetime} onChange={handleInput} />
                                    </div>
                                </div>
                                <div className="grid grid-cols-1">
                                    Street Address
                                    <input className='input' type="text" readOnly={readonly} name='destination_address' value={data.destination_address} onInput={handleInput} />
                                </div>
                                <div className="grid grid-cols-2 gap-4">
                                    <div className="grid grid-cols-1">
                                        City
                                        <input className='input' type="text" readOnly={readonly} name='destination_city' value={data.destination_city} onInput={handleInput} />
                                    </div>
                                    <div className="grid grid-cols-1">
                                        Postal Code
                                        <input className='input' type="text" readOnly={readonly} name='destination_postal_code' value={data.destination_postal_code} onInput={handleInput} />
                                    </div>
                                </div>
                                {
                                    !readonly && (
                                        <div>
                                            <button
                                                className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded float-right mt-3 ml-3'
                                                type='submit'>
                                                Save
                                            </button>
                                            <button
                                                className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded float-right mt-3 ml-3'
                                                type='button' onClick={resetForm}>
                                                Reset
                                            </button>
                                            <Link href={route('orders.index')} className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded float-right mt-3'>Cancel</Link>
                                        </div>
                                    )
                                }
                                {
                                    readonly && (
                                        <div>
                                            <Link
                                                className='bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded float-right mt-3 ml-3'
                                                href={route('orders.message', { id: order.id })}>
                                                Send Message
                                            </Link>
                                        </div>
                                    )
                                }
                            </form>
                        </CardBody>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}